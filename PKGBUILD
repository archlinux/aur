# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=19.0.0
pkgrel=1
epoch=1
pkgdesc="SlimeVR FBT software beta version"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('alsa-lib' 'at-spi2-core' 'cairo' 'gtk3' 'jre17-openjdk' 'libcups' 'libgcc' 'libstdc++' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'nspr' 'nss' 'pango')
optdepends=('libappindicator')

options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=(
	"SlimeVR-amd64-${pkgver}.deb"::"https://github.com/SlimeVR/SlimeVR-Server/releases/download/v19.0.0/SlimeVR-amd64.deb"
)

sha512sums_x86_64=(
	"881d9fcbdb91481d59dcab51c99cb6bbf5bec9bbe000e18e925e97221a7f231cacc31f9bd0a8e67c5d23102bb89e25ea13bf6e31e29c5c3cbfa6fde8a7113125"
)

package() {

  tar -xJ -f data.tar.xz -C "${pkgdir}"
  mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
  mv "${pkgdir}/opt/SlimeVR/69-slimevr-devices.rules" "${pkgdir}/usr/lib/udev/rules.d/"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/SlimeVR/slimevr" "${pkgdir}/usr/bin/slimevr"
}
