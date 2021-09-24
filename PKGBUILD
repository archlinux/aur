# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-mopidy-tidal
pkgver=0.2.5
pkgrel=1
pkgdesc='Tidal music service integration'
arch=('any')
url=https://github.com/tehkillerbee/mopidy-tidal
license=('Apache')
depends=(
	'mopidy>=3.0'
	'python-pykka>=1.1'
	'python-tidalapi>=0.6.8'
	'python-tidalapi<0.7.0'
	'python-requests>=2.0.0')
makedepends=('python-setuptools')
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/M/Mopidy-Tidal/Mopidy-Tidal-$pkgver.tar.gz")
sha256sums=('f77a1d8aef2fe7565482a054fc6d4c65ea62c14cccdc81864b867dfd3d037cde')

build() {
	cd "Mopidy-Tidal-$pkgver"
	python setup.py build
}

package() {
	cd "Mopidy-Tidal-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
