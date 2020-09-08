# Maintainer: Dane Johnson <daneallenjohnson AT protonmail DOT com>

pkgname=agar
pkgver=1.6.0
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
sha256sums=('750002f0b368fb582e45696a8dfc53fb45f5536792a7f0520cdcc20b488c9e2e')

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