# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-v
pkgver=1.0.2
pkgrel=1
pkgdesc='Font version string reporting and modification library + executable tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
depends=('python' 'python-gitpython' 'python-fonttools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5d4159dbee67e83122121df4edcb85083b4f283ef02330932cc81261f87bc57d')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
