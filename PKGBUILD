# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-turkish-morphology
pkgver=1.2.0
pkgrel=1
pkgdesc='A two-level morphological analyzer for Turkish'
arch=('any')
url="https://github.com/google-research/${pkgname#python-}"
license=('Apache')
depends=('absl-py' 'python' 'python-protobuf')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2f1b119826aaa4751d8e6de26c29506c8c2e1c59a4a40c5211556d6c70ee4e29')

build() {
	cd "${pkgname#python-}-$pkgver"
	python setup.py build
}

package() {
    cd "${pkgname#python-}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
