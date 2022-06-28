# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname='python-inotify'
_name="${pkgname#python-}"
pkgver=0.2.10
pkgrel=4
pkgdesc='Access inotify events via python (this is not related to python-pynotify)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('GPL2')
depends=(
    'python'
)
makedepends=(
    'python-setuptools'
)
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz"
        "${_name}-${pkgver}.tar.gz.sig")
sha256sums=('974a623a338482b62e16d4eb705fb863ed33ec178680fc3e96ccdf0df6c02a07'
            'SKIP')
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

build() {
    cd "${_tarname}"
    python setup.py build
}

package() {
    cd "${_tarname}"
    python setup.py install --prefix='/usr' --root="${pkgdir}" --optimize=1 --skip-build
}
