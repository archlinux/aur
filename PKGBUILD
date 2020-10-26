# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-v
pkgver=1.0.4
pkgrel=1
pkgdesc='Font version string reporting and modification library + executable tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
depends=('python' 'python-gitpython' 'python-fonttools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('909bd2325ab053c873e59beebcef4e3c9038d056354a36618b6fd7c1e6e76092')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
