# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-turkish-morphology
pkgver=1.2.1
pkgrel=1
pkgdesc='A two-level morphological analyzer for Turkish'
arch=('any')
url="https://github.com/google-research/${pkgname#python-}"
license=('Apache')
depends=('absl-py' 'python' 'python-protobuf')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d78251a1b97b2df5261156b9ef2efcaaabe1e2e390887c2985b48d3cfefdb794')

build() {
	cd "${pkgname#python-}-$pkgver"
	python setup.py build
}

package() {
    cd "${pkgname#python-}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
