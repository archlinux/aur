# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-v
pkgver=1.0.5
pkgrel=1
pkgdesc='Font version string reporting and modification library + executable tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
depends=('python' 'python-gitpython' 'python-fonttools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c54bd0db89e308c196bc48f34c0fc4db6286bfa9e07d56c2c5ba3d5dd9f520b3')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
