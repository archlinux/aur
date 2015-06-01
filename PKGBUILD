# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgbase=python-pylibmc-git
pkgname=(python-pylibmc-git python2-pylibmc-git)
pkgver=r479.a37a30d
pkgrel=1

pkgdesc="Quick and small memcached client for Python"
url="http://pypi.python.org/pypi/pylibmc"
arch=("i686" "x86_64")
license=("GPL")

makedepends=('gcc' 'zlib')

source=('git+https://github.com/lericson/pylibmc.git')

md5sums=('SKIP')

pkgver() {
	cd pylibmc
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-pylibmc-git() {
	provides=('python-pylibmc')
	conflicts=('python-pylibmc')

	depends=('python' 'libmemcached')

	cd pylibmc
	python setup.py install --root="$pkgdir"
}

package_python2-pylibmc-git() {
	provides=('python2-pylibmc')
	conflicts=('python2-pylibmc')

	depends=('python2' 'libmemcached')

	cd pylibmc
	python2 setup.py install --root="$pkgdir"
}
