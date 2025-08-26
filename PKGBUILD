# Maintainer: Mix <mnixry@outlook.com>
# Contributor: jdev082 <jdev0894@gmail.com>
# Contributor: Erde <erkkah@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
pkgname=tabby-bin
_pkgname=tabby
pkgver=1.0.227
pkgrel=1
pkgdesc="Tabby (formerly Terminus) is a highly configurable terminal emulator, SSH and serial client for Windows, macOS and Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/Eugeny/tabby"
license=('MIT')
depends=('nodejs' 'alsa-lib' 'nss')
optdepends=('gnome-keyring')
provides=("tabby" "tabby-terminal")
conflicts=("tabby")
source_x86_64=("$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.deb")
source_aarch64=("$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
sha256sums_x86_64=('a600cb4aa7326e70a9b3a10da52d7ae70a698aa132dc7602200857ff7ce92f07')
sha256sums_aarch64=('748ad945cf37b9a1aa0167eed08fa05b86416a940904674d06dcffc8d3870fb8')
options=('!strip' '!debug')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

 install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<END
  #!/usr/bin/bash
  /opt/Tabby/tabby

  chown root:root /opt/Tabby/chrome-sandbox
  chmod 4755 /opt/Tabby/chrome-sandox

END

}
