# Maintainer: Eric Hugoson
_pkgname=pylint-flask
pkgname=python-pylint-flask
pkgver=0.6
pkgrel=1
pkgdesc="A Pylint plugin to analyze Flask applications"
arch=('any')
url="https://github.com/jschaf/pylint-flask"
license=('GPL2')
depends=('python-pylint'
         'python-astroid')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/p/pylint-flask/pylint-flask-${pkgver}.tar.gz)
md5sums=('95988ad4ee6fbfd2326c96b5e9ab71a6')
sha512sums=('ab205a42464659fbe003a00eb07c37842c7e0afcb9ef846b7cadaf31faf44ba9a6e424e4ae60553529371afb1fda527907818f248864bc798b8b4c298fd7dd37')

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
