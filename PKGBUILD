# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.39.0
pkgrel=2
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('d3802e9ca3dd2b6b85bb563514912ad138858652d22500e66db24d46d36f81ec')

# pkgver() {
#     curl -sH "Accept: application/vnd.github.v3+json" 'https://api.github.com/repos/friendlyanon/cmake-init/tags'  | jq -r '.[0].name' | sed 's/v//;s/-/./;s/-/./'
# }

package() {
    PIP_CONFIG_FILE=/dev/null pip install --root-user-action=ignore --isolated --prefix=/usr --root="$pkgdir" --ignore-installed --no-deps "${_name//-/_}-$pkgver-py3-none-any.whl"
}
