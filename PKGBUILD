# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.21.5
pkgrel=1
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('0e1b8036c142965c7a1aaa71f5602d3623f4f787960ce66d5fc9fff5bbdf2029')

# build() {
#         echo ''
# }

package() {
	PIP_CONFIG_FILE=/dev/null pip install --no-warn-script-location --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name//-/_}-$pkgver-py3-none-any.whl"
	python -O -m compileall "${pkgdir}/usr/lib/python3.9/site-packages/cmake_init_lib"
}
