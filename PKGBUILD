# Maintainer: Mix <mnixry@outlook.com>
# Contributor: jdev082 <jdev0894@gmail.com>
# Contributor: Erde <erkkah@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
pkgname=tabby-bin
_pkgname=tabby
pkgver=1.0.223
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
sha256sums_x86_64=('93028e1ae6b62a7675921fc43241668f675336c1bbe4891906ced3c80dc99d13')
sha256sums_aarch64=('e6c8577d8a285a30bed28b79b0fa2c69be6b060f163f74e32db2cbcd8017ca5b')
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
