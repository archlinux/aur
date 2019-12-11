# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=BourgeoisLab
_pkgname=GPXLab
pkgname=${_pkgname,,}
pkgver=0.7.0
pkgrel=1
pkgdesc='Program to show and manipulate GPS tracks'
arch=(x86_64)
url='https://github.com/BourgeoisLab/GPXLab'
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
optdepends=('qt5-translations: for Qt5 dialog translations')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('cb9fbcde4688c388b781c90b7c48a60a76c5d5bed14e5040e55a13a3f810aa0e')

build() {
  cd ${_pkgname}-${pkgver}

  lrelease GPXLab/GPXLab.pro
  qmake PREFIX=/usr GPXLab.pro
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make INSTALL_ROOT="${pkgdir}" install
}
