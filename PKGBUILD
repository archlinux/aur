# Maintainer: duanluan <duanluan@outlook.com>

pkgname=wuyou-toolkit-bin
_pkgname=wuyou-toolkit
pkgver=0.1.0
pkgrel=1
pkgdesc='Native shell for wuyou-toolkit (prebuilt binary)'
arch=('x86_64')
url='https://github.com/duanluan/wuyou-toolkit-releases'
license=('unknown')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('wuyou-toolkit')
conflicts=('wuyou-toolkit')
options=('!strip')
source=("${_pkgname}-${pkgver}.deb::https://github.com/duanluan/wuyou-toolkit-releases/releases/download/v0.1.0/wuyou-toolkit_0.1.0_amd64.deb")
sha256sums=('9eca4a65dfbc15c6ee8fd42189c8939d8c67333c2bc32c1935f89cd4bb815b64')

package() {
  local _debdir
  _debdir="$(mktemp -d)"
  trap 'rm -rf "${_debdir}"' EXIT

  bsdtar -C "${_debdir}" -xf "${srcdir}/${_pkgname}-${pkgver}.deb"
  bsdtar -C "${pkgdir}" -xf "${_debdir}/data.tar.gz"
}
