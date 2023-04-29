# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=git-imerge
pkgver=1.2.0
pkgrel=3
pkgdesc='Incremental merge for Git'
url=https://github.com/mhagger/git-imerge
arch=(any)
license=(GPL2)
depends=(python git)
makedepends=(python-setuptools bash-completion)
checkdepends=(python-tox)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('bae4266f288320b8fe3637f6e3c133ed423a2c85a56f03db4a3210eb99f66c8e11c61cecf7ea0335f4798c92a175acad5525494680c5c3531403fa433b221ee9')

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
