# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=python-proto-plus
_name=proto-plus
pkgver=1.11.0
pkgrel=1
pkgdesc="A wrapper around protocol buffers."
arch=('any')
url="https://github.com/googleapis/proto-plus-python"
license=('Apache')
optdepends=('python-google-api-core: Testing')
makedepends=('python'
'python-setuptools'
'python-protobuf>=3.12.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('63026876adf69edec1e33e3e82897f1e')


prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build 
}
