# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='python-typing-inspect'
pkgname=('python-typing-inspect')
_module='typing_inspect'
pkgver='0.6.0'
pkgrel=2
pkgdesc='Runtime inspection utilities for Python typing module'
url='https://github.com/ilevkivskyi/typing_inspect'
depends=(
    'python'
    'python-mypy_extensions'
    'python-typing_extensions'
)
optdepends=()
makedepends=(
    'python-setuptools'
)
license=('MIT')
arch=('any')
source=(
    'https://files.pythonhosted.org/packages/source/t/typing_inspect/typing_inspect-0.6.0.tar.gz'
)
md5sums=('987fa620fd0ac7b6be9c8f6d71eeea2e')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    pushd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    popd
}
