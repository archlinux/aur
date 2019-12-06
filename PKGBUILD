# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Peter Semiletov <peter.semiletov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea-qt
pkgver=50.0.3
pkgrel=1
pkgdesc="Powerful text editor for Linux and *BSD."
arch=('x86_64')
url="http://semiletov.org/tea/"
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'gcc-libs' 'aspell' 'hunspell' 'poppler-qt5' 'djvulibre' 'desktop-file-utils')
makedepends=('cmake')
source=(https://github.com/psemiletov/tea-qt/archive/$pkgver.tar.gz)
md5sums=(d8a043ef801f9ff81eb9326bbaa2e3c4)

build() {
  mkdir -p "${srcdir}/tea-qt-${pkgver}/b"
  cd "${srcdir}/tea-qt-${pkgver}/b"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd "${srcdir}/tea-qt-${pkgver}/b"
  make DESTDIR="$pkgdir" install
}
