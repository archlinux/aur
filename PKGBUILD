#
# fileobj PKGBUILD
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
#

pkgname=fileobj
pkgver=0.8.7
pkgrel=1

pkgdesc="Ncurses based hex editor with vi interface written in Python "
arch=('any')
url="https://github.com/kusumi/fileobj"
license=('BSD-2-Clause')
depends=('python')
makedepends=()
optdepends=()

source=(https://github.com/kusumi/${pkgname}/archive/v${pkgver//_/-}.tar.gz)

sha256sums=('8e1e26219f689827091343efa132bb7fee92d201c1bfbcea22dab0a4c8cf3aa3')

noextract=()

pkg_name_ver="${pkgname}-${pkgver//_/-}"

prepare() {
  cd "${srcdir}/${pkg_name_ver}"
}

build() {
  cd "${srcdir}/${pkg_name_ver}"
  python ./setup.py build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkg_name_ver}"
  python ./setup.py install --root "${pkgdir}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

#
# EOF
#
