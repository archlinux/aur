# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.40.2
pkgrel=1
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('3c29363674a5340298999320331f1b251e8ae7a57bbf0f2c1fd279c2599928a1')

# pkgver() {
#     curl -sH "Accept: application/vnd.github.v3+json" 'https://api.github.com/repos/friendlyanon/cmake-init/tags'  | jq -r '.[0].name' | sed 's/v//;s/-/./;s/-/./'
# }

package() {
    PIP_CONFIG_FILE=/dev/null pip install --root-user-action=ignore --isolated --prefix=/usr --root="$pkgdir" --ignore-installed --no-deps "${_name//-/_}-$pkgver-py3-none-any.whl"
}
