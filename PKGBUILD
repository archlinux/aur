# Maintainer: Dane Johnson <daneallenjohnson AT protonmail DOT com>

pkgname=agar
pkgver=1.7.1
pkgrel=1
pkgdesc='A cross-platform GUI toolkit'
arch=('x86_64')
url='https://libagar.org/'
license=('BSD')
depends=('libgl')
optdepends=('libxinerama: xinerama support'
            'fontconfig: font selection'
            'sdl: sdl support'
            'libjpeg: jpeg exporting'
            'libpng: png exporting')

source=("http://stable.hypertriton.com/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d1eb994c8262cd70df1d4d9462c5453089db5dc815d01b5767508c2923a5965c')

build() {
        cd "$pkgname-$pkgver"
        ./configure --prefix=/usr --mandir=/usr/share/man
        make
}

package() {
          cd "$pkgname-$pkgver"
          make DESTDIR="$pkgdir/" install
          install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
