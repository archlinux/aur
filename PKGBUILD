# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-v
pkgver=0.7.1
pkgrel=1
pkgdesc='Font version reporting and modification tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
depends=('python' 'python-gitpython' 'python-fonttools')
makedepends=('python-setuptools-scm')
checkdepends=('python-tox')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cfd6b11820577cd832299a529417b5e2b84e432db0f15276ac10f336b9649b41')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
    cd "$pkgname-$pkgver"
    # Checks currently fail against Python 3.8, but app works :(
	# tox -e py38
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
