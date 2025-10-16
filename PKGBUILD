# Maintainer: Mix <mnixry@outlook.com>
# Contributor: jdev082 <jdev0894@gmail.com>
# Contributor: Erde <erkkah@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
pkgname=tabby-bin
_pkgname=tabby
pkgver=1.0.228
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
sha256sums_x86_64=('7fba91462095df46e31c2647db747e786171bac5f917f0757d3b1397b0cc8e61')
sha256sums_aarch64=('206a03567048f9c342dd0c4c1e525a672a5e89b8f98a4c8e60a0aa7354a1aa95')
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
