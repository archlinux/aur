# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.40.0
pkgrel=1
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('006478961c76bde5639494ff81da5aec4c90ff46a0eecebadee75a131551ed94')

# pkgver() {
#     curl -sH "Accept: application/vnd.github.v3+json" 'https://api.github.com/repos/friendlyanon/cmake-init/tags'  | jq -r '.[0].name' | sed 's/v//;s/-/./;s/-/./'
# }

package() {
    PIP_CONFIG_FILE=/dev/null pip install --root-user-action=ignore --isolated --prefix=/usr --root="$pkgdir" --ignore-installed --no-deps "${_name//-/_}-$pkgver-py3-none-any.whl"
}
