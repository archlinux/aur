# Maintainer: silverhikari
pkgname=qtau-git
pkgver=0.5.5.r0.g453cc85
pkgrel=1
pkgdesc="open source utau music editor"
arch=(x86_64)
url="https://notabug.org/isengaara/qtau"
license=('GPL')
depends=('jack' 'libsmf' 'qt5-base' 'libsamplerate' 'hts-engine-api-git' 'sekai-git' 'sinsy-isengaara-git')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://notabug.org/isengaara/qtau')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
git describe --long --tags | sed 's\^upstream/\\;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    qmake PREFIX="$pkgdir/usr"
    make
}
package() {
	cd "$srcdir/${pkgname%-git}"
	make install
}
