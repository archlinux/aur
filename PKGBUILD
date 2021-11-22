# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

_pkgname=py3nvml
pkgname=python-${_pkgname}
pkgver=0.2.7
pkgrel=1
pkgdesc="Bindings for NVML library."
arch=('any')
url="https://github.com/fbcotter/py3nvml"
license=('BSD')
depends=('nvidia-utils' 'python')
makedepends=('python-setuptools')
provides=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('09ee1d04598a6e664e24465f804ce3bfe119a6fdb5362df1c168f8aa929fbd73')

build() {
	cd "${_pkgname}-$pkgver"
	python setup.py build
}

package() {
	cd "${_pkgname}-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
