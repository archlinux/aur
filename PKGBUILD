# Maintainer: Philipp A. <flying-sheep@web.de>

_name=alembic-autogenerate-enums
pkgname=python-$_name
pkgver=0.0.2
pkgrel=1
pkgdesc='Alembic hook that causes --autogenerate to output PostgreSQL ALTER TYPE statements.'
arch=(any)
url="https://github.com/dw/$_name"
license=(MIT)
depends=(python python-alembic python-sqlalchemy)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('adb49909c864a263f92bf7b99752d5c4b2f496617cccb5cfc689af9c72235ff9')

package() {
	cd "$srcdir/${_name//-/_}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
