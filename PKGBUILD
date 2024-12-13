# Contributor: Médéric Boquien <mboquien@free.fr>

_pkg=aplpy
pkgname=python-${_pkg}
pkgver=2.2.0
pkgrel=1
pkgdesc="An astronomical plotting library in python"
arch=('any')
url="https://aplpy.github.io/"
license=("MIT")
depends=('python' 'python-matplotlib' 'python-numpy' 'python-pyregion' 'python-pillow' 'python-astropy' 'python-pyavm' 'python-reproject')
source=("https://files.pythonhosted.org/packages/source/a/aplpy/aplpy-${pkgver}.tar.gz")
sha512sums=('efb5af12da698861c596d3935580ca5dbe168779382702064ed8c728f9a56e82c06eb6ee101a0c66afaf35e7e55c7a9f53fa07aba379b91e13f2fa4ddce0ec98')

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

package(){
    cd "${_pkg}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D LICENSE.md "${pkgdir}/usr/share/licenses/python-${_pkg}/LICENSE.md"
}
