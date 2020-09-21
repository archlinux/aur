# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-v
pkgver=1.0.3
pkgrel=1
pkgdesc='Font version string reporting and modification library + executable tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
depends=('python' 'python-gitpython' 'python-fonttools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7ff3cc2d77de948658eb02abeb0d85455bb74495d0e5ee356bdbd370776b67ec')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
