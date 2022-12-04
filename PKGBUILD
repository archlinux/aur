# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgbase='python-sqlmodel'
pkgname=('python-sqlmodel')
_module='sqlmodel'
pkgver='0.0.8'
pkgrel=1
pkgdesc="SQLModel, SQL databases in Python, designed for simplicity, compatibility, and robustness."
url="https://github.com/tiangolo/sqlmodel"
depends=(
	'python'
	'python-pydantic'
	'python-sqlalchemy'
	'python-sqlalchemy2-stubs'
)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('d4a849d0bf237c9feb52eed70520b08154d13993c8b996d85fcd33303a965bda40ffc13c0a5ff16710328e44a62e01a4c2728c5c2aceae7a5ef4557a46bd3998')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
