# Maintainer: Eric Hugoson
_pkgname=requirements-detector
pkgname=python-requirements-detector
pkgver=0.6
pkgrel=1
pkgdesc="A library that can be used to retrieve program settings from a variety of sources"
arch=('any')
url="https://github.com/landscapeio/requirements-detector"
license=('MIT')
depends=('python-astroid')
makedepends=('python-setuptools')
source=(https://github.com/landscapeio/requirements-detector/archive/${pkgver}.tar.gz)
sha512sums=('78723dc187a35267799780c7ddf645c7179ae8947281d2aa69f350c2bd06a29dddb13f595ee89cbbaa52f9865617084eaac645f897631cd24983967a5b392cd6')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"

    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
