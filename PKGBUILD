# Maintainer: Alexander Nortung <alex underscore nortung at live dot dk>
# Co-Maintainer: Serge K <arch@phnx47.net>

_pkgname=oxen-electron-wallet
pkgname=oxen-gui-wallet-appimage
pkgver=1.8.0
pkgrel=2
pkgdesc="Oxen electron GUI wallet"
arch=('x86_64')
url="https://github.com/oxen-io/oxen-electron-gui-wallet"
license=('BSD')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
_bin="${_pkgname}-${pkgver}-linux.AppImage"
source=("${_bin}::https://github.com/oxen-io/oxen-electron-gui-wallet/releases/download/v${pkgver}/${_bin}")
sha256sums=('88b9e41d87b550069429c415888ea0513319c150505ff1dd7c01731fbf1d0118')

package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/opt/${_pkgname}/${_bin}"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_bin}" "${pkgdir}/usr/bin/${_pkgname}"
}
