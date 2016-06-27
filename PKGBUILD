# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgname=requirements-detector
pkgname=python-requirements-detector
pkgver=0.4.1
pkgrel=1
pkgdesc="A library that can be used to retrieve program settings from a variety of sources"
arch=('any')
url="https://github.com/landscapeio/requirements-detector"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/landscapeio/requirements-detector/archive/${pkgver}.tar.gz)
md5sums=('67a96af759662d842a33492337c6fba1')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"

    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
# vim:set ts=2 sw=2 et:
