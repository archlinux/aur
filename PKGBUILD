# Maintainer: Dane Johnson <daneallenjohnson AT protonmail DOT com>

pkgname=agar
pkgver=1.7.0
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
sha256sums=('17313d223b5ea94f9fa0303ddd82edc8ee0e7cc17953df38a5ee6b67cb849446')

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