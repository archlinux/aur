# Maintainer: Shahzeb Khattak <shahzebkhattak at proton dot me>

pkgname=protonvpn-cli
_gitpkgname=proton-vpn-cli
pkgver=0.1.2
pkgrel=2
pkgdesc="ProtonVPN CLI"
arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/ProtonVPN/proton-vpn-cli"
depends=(
  'python'
  'python-click'
  'python-dbus-fast'
  'python-packaging'
  'python-proton-keyring-linux'
  'python-proton-vpn-api-core>=4.13.2'
  'python-proton-core'
  'python-proton-vpn-local-agent'
  'python-proton-vpn-network-manager'
)
makedepends=(
  'python-setuptools'
  )
source=(${_gitpkgname}-${pkgver}.tar.gz::"https://github.com/ProtonVPN/${_gitpkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6dc9f3b60a3a434119f12c777534de68476f4ae027062618eb1cbb8b1da3a774')

build() {
  cd "${_gitpkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_gitpkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
