# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-mopidy-tidal
pkgver=0.2.6
pkgrel=1
pkgdesc='Tidal music service integration'
arch=('any')
url=https://github.com/tehkillerbee/mopidy-tidal
license=('Apache')
depends=('mopidy' 'python-pykka' 'python-tidalapi' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/M/Mopidy-Tidal/Mopidy-Tidal-$pkgver.tar.gz")
sha256sums=('69cec07e5065acc47e757a07c972130d7d148288450e0385b84d60f9dadc5cc3')

build() {
	cd "Mopidy-Tidal-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "Mopidy-Tidal-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
