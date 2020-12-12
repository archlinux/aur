# Maintainer: somini <dev@somini.xyz>

pkgbase=python-argparse-utils
pkgname=python-argparse-utils
_module='argparse_utils'
pkgver=1.3.0
pkgrel=3
pkgdesc="A collection of utilities for the Python standard-library argparse module"
url="https://github.com/madman-bob/python-argparse-utils"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
    "setup.py"
)
sha256sums=('2a9d6109968fe34f96c801991e9afc61dd1be14735bfb89e7e6333584acc52f0'
            '1df87c65a5208e1ec304f13b5e8a451d1dbd1ba8356c12b7d293b9d81b9b0f45')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python "$srcdir/setup.py" build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python "$srcdir/setup.py" install --root="${pkgdir}" --optimize=1 --skip-build
}
