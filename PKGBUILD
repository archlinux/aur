#
# fileobj PKGBUILD
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
#

pkgname=fileobj
pkgver=0.8.2
pkgrel=1

pkgdesc="Ncurses based hex editor with vi interface written in Python "
arch=('any')
url="https://github.com/kusumi/fileobj"
license=('GPL')
depends=('python')
makedepends=()
optdepends=()

source=(https://github.com/kusumi/${pkgname}/archive/v${pkgver//_/-}.tar.gz)

sha256sums=('6d459eb801e381652868bc1799b6ed9b80ac670559f7019e7d9aeed0a5f06416')

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
}

#
# EOF
#
