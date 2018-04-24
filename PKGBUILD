# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=SimpleITK
_py=cp36
pkgname=python-simpleitk
pkgver=1.1.0
pkgrel=1
pkgdesc='Simplified layer built on top of ITK'
arch=('x86_64')
url='https://simpleitk.org/'
license=('apache')
depends=('python')
conflicts=('simpleitk')
makedepends=('python-pip')
options=('!strip')
optdepends=()
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-${_py}m-manylinux1_x86_64.whl")
sha256sums=('9077301b0a91d93613588201e03de70b00736f97c542d0a04527ef8f1c78a53a')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	python -O -m compileall "${pkgdir}/usr/lib/python3.6/site-packages/SimpleITK"
}

