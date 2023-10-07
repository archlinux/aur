# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=SimpleITK
_python_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
_py="cp${_python_version//./}"
pkgname=python-simpleitk-bin
pkgver=2.3.0
pkgrel=1
pkgdesc='A simplified layer built on top of ITK'
arch=('x86_64')
url='https://simpleitk.org/'
license=('apache')
depends=('python')
provides=('python-simpleitk')
conflicts=('python-simpleitk')
makedepends=('python-pip')
optdepends=()
noextract=("${_name}-${pkgver}-${_py}-${_py}-manylinux_2_17_x86_64.manylinux1_x86_64.whl")
options=('!strip')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-${pkgver}-${_py}-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
sha256sums=('e5eb7507bc0f0cefed667d1d0ce9f2adc43bb672c630233af8481eff8388b1d0')

package() {
	cd "${srcdir}"
    python -m installer --destdir="$pkgdir" ./*.whl
}
