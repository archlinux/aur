# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-turkish-morphology
pkgver=1.2.2
pkgrel=1
pkgdesc='A two-level morphological analyzer for Turkish'
arch=('any')
url="https://github.com/google-research/${pkgname#python-}"
license=('Apache')
depends=('absl-py' 'python' 'python-protobuf')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e84d5e097de901bfc5d7d08bd94c2ec3a09883fdeef828c880af173435ed88a7')

build() {
	cd "${pkgname#python-}-$pkgver"
	python setup.py build
}

package() {
    cd "${pkgname#python-}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
