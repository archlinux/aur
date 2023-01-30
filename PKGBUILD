# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=git-imerge
pkgver=1.2.0
pkgrel=2
pkgdesc='Incremental merge for Git'
url=https://github.com/mhagger/git-imerge
arch=(any)
license=(GPL2)
depends=(python git)
makedepends=(python-setuptools bash-completion)
checkdepends=(python-tox)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('2da805b37e5bae4188845206b2fca74087eaaf37d364efe0c0611c87671862f8a4b2e9114631124ade70df960ccdb0573205e747dc4ea1c6cdb1a9b07fe234e6')

build () {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package () {
	cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

check () {
	cd "$pkgname-$pkgver"
	tox --sitepackages
}
