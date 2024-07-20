# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgbase='python-sqlalchemy2-stubs'
pkgname=('python-sqlalchemy2-stubs')
_module='sqlalchemy2-stubs'
pkgver='0.0.2a38'
pkgrel=2
pkgdesc="Typing Stubs for SQLAlchemy 1.4"
url="http://www.sqlalchemy.org"
depends=(
	'python>=3.12'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('45144a87fd625cd530658bf70697b56df1ccd56883c82dd983fc148ccec120eef4ba8c1856e568ecea4839c5bc2a9a1c6fc91616d5a0eac2aec5dcbd07d6d1b9')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
}
