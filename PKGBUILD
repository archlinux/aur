# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>

_name='libtcod'

pkgname=python-libtcod
pkgver=1.15.1
pkgrel=2
pkgdesc='Python Roguelike graphics/utility library.'
arch=('any')
url='https://github.com/libtcod/libtcod'
license=('BSD')
depends=('python' 'libtcod')
makedepends=('python-setuptools')
source=("https://github.com/${_name}/${_name}/archive/${pkgver}.tar.gz")

package() {
	cd "${srcdir}/${_name}-${pkgver}/python"
	python setup.py install --root=${pkgdir}

	# Link libtcod.so so the Python library finds it.
	pythonver="$(python -V)"
	cd "${pkgdir}/usr/lib/python${pythonver:7:3}/site-packages/${_name}py"
	ln -s ../../../libtcod.so .
}

md5sums=('909fdab63c4467dd7e73ba2056d8f6e1')
