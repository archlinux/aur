#
# fileobj PKGBUILD
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
#

pkgname=fileobj
pkgver=0.7.25
pkgrel=1
pkgdesc="Portable hex editor with vi like interface written in Python "
arch=('any')
url="http://sourceforge.net/projects/fileobj"
license=('GPL')
depends=('python')
makedepends=()
optdepends=()

source=(https://github.com/kusumi/${pkgname}/archive/v${pkgver//_/-}.tar.gz)

md5sums=('509c1ad4ae2ef36d3677a26cd68344b9')

noextract=()

pkg_name_ver="${pkgname}-${pkgver//_/-}"

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
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
