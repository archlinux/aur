# Maintainer: Harrison <htv04rules at gmail dot com>

_pkgname="discord-rpc"
_url="discord/${_pkgname}"

pkgname="${_pkgname}-bin"
pkgver=3.4.0
pkgrel=2
pkgdesc="Library for interfacing your game with a locally running Discord desktop client"
arch=("x86_64")
url="https://github.com/${_url}"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/discord-rpc-linux.zip"
        "https://raw.githubusercontent.com/${_url}/v${pkgver}/LICENSE")
sha256sums=("dac1f5dc6bedaeab1cc3c2c7fd4261e00838c81619c3ee325f3723c3d55ee03a"
            "12054cc15e274c9a10966fd7d8740c12dbd679dec2468e370818d899f9a3a634")

package() {
  cd "${srcdir}"
  
  # Install binary
  install -Dm0755 discord-rpc/linux-dynamic/lib/libdiscord-rpc.so "${pkgdir}/usr/lib/libdiscord-rpc.so"

  # Install license
  install -Dm0755 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
