# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=qps
pkgver=2.8.0
pkgrel=1
pkgdesc="a visual process manager, an X11 version of 'top' or 'ps'."
url="https://github.com/lxqt/qps"
depends=('qt5-x11extras' 'qt5-tools' 'liblxqt')
makedepends=('cmake' 'lxqt-build-tools' 'lxqt-config')
arch=('i686' 'x86_64')
license=("GPL")
source=("$pkgname-$pkgver.tar.xz::https://github.com/QtDesktop/qps/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
	"qps.desktop")
sha256sums=('10252dbd4d4898f27e7ce45f300885fbe1fffd287123ab620978159c5c50dc74'
            '5216455ce5ce096b36f1b301325fd44c972ff796aa3b40b60807a06dae0ab3f9')

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
