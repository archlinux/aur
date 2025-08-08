# Maintainer: Mix <mnixry@outlook.com>
# Contributor: jdev082 <jdev0894@gmail.com>
# Contributor: Erde <erkkah@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
pkgname=tabby-bin
_pkgname=tabby
pkgver=1.0.224
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
sha256sums_x86_64=('a12e0999a42f36ea90d4f0b8a566c8df83cd2967d703b5456421c5266ad84231')
sha256sums_aarch64=('7e72417b1ecd4d149b31170854f0acddc7cd032488018cd00666c8f273c773fc')
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
