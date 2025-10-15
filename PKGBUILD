# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname='python-inotify'
_name="${pkgname#python-}"
pkgver=0.2.12
pkgrel=1
pkgdesc='Access inotify events via python (this is not related to python-pynotify)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
sha256sums=('9aee407f92c7d51a2ce50f3b78291a9094e334e34bd68e82bf60020795fa2c94')

build() {
    cd "${_tarname}"
    python setup.py build
}

package() {
    cd "${_tarname}"
    python setup.py install --prefix='/usr' --root="${pkgdir}" --optimize=1 --skip-build
}
