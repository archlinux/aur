# Maintainer: Julian Daube <joposter at gmail dot com>
# Maintainer: sasvari <sasvari@fastmail.com>
pkg="nazca"
pkgname="python-$pkg"
pkgver=0.6.1
pkgrel=1
pkgdesc="Nazca module for photonic integrated circuit design."
arch=(any)
url="https://nazca-design.org/"
license=("AGPLv3+")
depends=("python>=3.10" 
	"python-yaml>=5.1"
	"python-numpy>=1.26.0"
	"python-scipy>=1.13.0"
	"python-pandas>2.2.2" 
	"python-matplotlib>=3.8.4" 
	"python-pillow>=9.4.0" 
	"python-pyclipper>=1.3.0.post5"
	"ipython>=7.20.0")


source=("https://nazca-design.org/dist/$pkg-$pkgver.tar.gz")

makedepends=(python-build python-installer python-wheel python-poetry)

build() {
    cd $pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('b96c25fa8f84cfc49a17156b7fb15fde53b2b911be593145bdea1559aded47dc')
