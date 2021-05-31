# Maintainer: Denis Vadimov <me@bloody.pw>
pkgname=python-bpylist2
pkgver=3.0.3
pkgrel=1
pkgdesc="Parse and Generate binary plists and NSKeyedArchiver archives"
arch=('any')
url="https://github.com/parabolala/bpylist2"
license=('MIT')
depends=('python3')
makedepends=('git')
source=("python-bpylist2::git+$url.git")
md5sums=('SKIP')


pkgver() {
	cd "${srcdir}/${pkgname}"
	ver=$(git describe --tags --abbrev=0)
	echo "${ver/v/}"
}


package() {
	cd "${srcdir}/${pkgname}"
	bpylist_ver=$(git describe --tags --abbrev=0)
	git checkout tags/$bpylist_ver

	python setup.py install --root="$pkgdir"
}
