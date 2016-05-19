# Contributer: Donald Carr<sirspudd@gmail.com>

pkgname=qtcreator-prerelease
_pkgvermajmin=4.0
pkgver=${_pkgvermajmin}.0
_pkgver=${pkgver}
_filename=qt-creator-opensource-src-${_pkgver}
_devurlbase="https://download.qt.io/development_releases"
_relurlbase="https://download.qt.io/official_releases"
pkgrel=1
pkgdesc='Qt Creator prerelease/latest'
arch=('x86_64')
url='http://qt.io/ide'
license=('GPL')
provides=('qtcreator')
conflicts=('qtcreator')
depends=('qt5-base')
makedepends=('gcc' 'qt5-base')
source=("${_relurlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_filename}.tar.gz")
sha256sums=('0cc21d720bafc72ce67f45a5553c618e8fffec3f2f23b94a2b2a9ba68ed0e2c8')

build() {
  cd "$srcdir/${_filename}"
  qmake QTC_PREFIX=/usr qtcreator.pro
  make
}

package() {
  cd "$srcdir/${_filename}"
  INSTALL_ROOT="$pkgdir" make install
}
