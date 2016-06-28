# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgname=pylint-flask
pkgname=python-pylint-flask
pkgver=0.3
pkgrel=1
pkgdesc="A Pylint plugin to analyze Flask applications"
arch=('any')
url="https://github.com/jschaf/pylint-flask"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/jschaf/pylint-flask/archive/v${pkgver}.tar.gz)
md5sums=('ddc7bde244e7cdfdb2326d2c87a96d73')

build() {
  cd "${_pkgname}-${pkgver}"

  sed -i "s/0.2/0.3/" setup.py
  python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"

    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
# vim:set ts=2 sw=2 et:
