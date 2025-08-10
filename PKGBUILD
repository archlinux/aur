# Maintainer: Mix <mnixry@outlook.com>
# Contributor: jdev082 <jdev0894@gmail.com>
# Contributor: Erde <erkkah@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
pkgname=tabby-bin
_pkgname=tabby
pkgver=1.0.225
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
sha256sums_x86_64=('1eb2185d54bbb24ad7155e506e3dc69254acb69a5b12d85b31c6ccdbca52fcf2')
sha256sums_aarch64=('14d8338200b2ebf2acdf6ecda71ce0d54fdaddc776e2724d704b9374214f15ae')
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
