# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_name=SimpleITK
_py="cp312"
pkgname=python-simpleitk-bin
pkgver=2.3.1
pkgrel=1
pkgdesc='A simplified layer built on top of ITK'
arch=('x86_64')
url='https://simpleitk.org/'
license=('apache')
depends=('python')
provides=('python-simpleitk')
conflicts=('python-simpleitk')
makedepends=('python-installer')
optdepends=()
noextract=("${_name}-${pkgver}-${_py}-${_py}-manylinux_2_17_x86_64.manylinux1_x86_64.whl")
options=('!strip')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-${pkgver}-${_py}-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
sha256sums=('7b4b9e7d64e53539216666a6b5b477e033e8738b1725f938e3c331b07539bd82')

package() {
	cd "${srcdir}"
    python -m installer --destdir="$pkgdir" ./*.whl
}
