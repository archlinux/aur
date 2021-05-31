# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Peter Semiletov <peter.semiletov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea-qt
pkgver=60.3.0
pkgrel=1
pkgdesc="Powerful text editor for Linux, *BSD, Windows, OS/2, Mac and Haiku OS"
arch=('x86_64')
url="http://semiletov.org/tea"
license=('GPL')
depends=('qt6-base' 'qt6-5compat' 'gcc-libs' 'zlib' 'hunspell' 'desktop-file-utils')
makedepends=('cmake')
source=(https://github.com/psemiletov/tea-qt/archive/$pkgver.tar.gz)
md5sums=(40d284eaf41fbb25f0ca5e339f77b0a1)

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
