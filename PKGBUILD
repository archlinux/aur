# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-bloom
_name=${pkgname#python-}
pkgver=0.11.2
pkgrel=1
pkgdesc="Bloom is a release automation tool."
arch=('any')
url="http://www.ros.org/wiki/bloom"
license=('BSD')
depends=('python' 'python-empy' 'python-rosdep' 'python-vcstools')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('37136d58c29d401963d77f44985cac0a379e39fe262c2add9ca49279e9c0a6ff')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
