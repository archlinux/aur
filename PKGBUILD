# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=python-speech
_name=google-cloud-speech
pkgver=2.0.0
pkgrel=1
pkgdesc="A google cloud speech api for python to convert audio to text."
arch=('any')
url="https://github.com/googleapis/python-speech"
license=('Apache')
makedepends=('python'
'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('SKIP')


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
