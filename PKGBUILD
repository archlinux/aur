# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Andy Bao <contact at andybao dot me>

pkgname="pterodactyl-wings-bin"
pkgver=1.11.3
pkgrel=1
pkgdesc="The server control plane for Pterodactyl Panel - binary package"
url="https://pterodactyl.io/"
license=("MIT")
arch=("x86_64" "aarch64")
depends=("docker")
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}" "pterodactyl-daemon")
options=(!strip)
source=("${pkgname/-bin/}.service")
source_x86_64=("${pkgname/-bin/}-$CARCH::https://github.com/pterodactyl/wings/releases/download/v$pkgver/wings_linux_amd64")
source_aarch64=("${pkgname/-bin/}-$CARCH::https://github.com/pterodactyl/wings/releases/download/v$pkgver/wings_linux_arm64")
sha256sums=('62dfff25f9bdae4769f4201ed30e7c2bfca54611bee75512c5626e74c764f46e')
sha256sums_x86_64=('a5ec554220b721d2cf0b6dd795611f1575d22e650dd2ba415ed4ec1a0295e6f3')
sha256sums_aarch64=('966b61a9c070ae9073cda634f53dcfa56f05e94645c51cc519a8591f7a25673e')

package(){
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "${pkgname/-bin/}-$CARCH" "$pkgdir/usr/bin/wings"
 install -D -m 644 "${pkgname/-bin/}.service"   "$pkgdir/usr/lib/systemd/system/${pkgname/-bin/}.service"
}
