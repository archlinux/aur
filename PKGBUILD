#
# fileobj PKGBUILD
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
#

pkgname=fileobj
pkgver=0.8.6
pkgrel=1

pkgdesc="Ncurses based hex editor with vi interface written in Python "
arch=('any')
url="https://github.com/kusumi/fileobj"
license=('BSD-2-Clause')
depends=('python')
makedepends=()
optdepends=()

source=(https://github.com/kusumi/${pkgname}/archive/v${pkgver//_/-}.tar.gz)

sha256sums=('3b8d907798bc072faf0afe7b42557f1923080e46d80e0737493f01a08d0c5254')

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
