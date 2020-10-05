# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=langcodes
pkgname=python-langcodes
pkgver=2.1.0
pkgrel=1
pkgdesc="A toolkit for working with and comparing the standardized codes for languages"
arch=('any')
url="https://github.com/LuminosoInsight/langcodes"
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
