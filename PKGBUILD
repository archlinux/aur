# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Andy Bao <contact at andybao dot me>

pkgname="pterodactyl-wings-bin"
pkgver=1.6.1
pkgrel=1
pkgdesc="The server control plane for Pterodactyl Panel - binary package"
url="https://pterodactyl.io/"
license=("MIT")
arch=("x86_64" "aarch64")
depends=("docker")
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}" "pterodactyl-daemon")
options=(!strip)
source_x86_64=("${pkgname/-bin/}-$CARCH::https://github.com/pterodactyl/wings/releases/download/v$pkgver/wings_linux_amd64")
source_aarch64=("${pkgname/-bin/}-$CARCH::https://github.com/pterodactyl/wings/releases/download/v$pkgver/wings_linux_arm64")
source=("${pkgname/-bin/}.service")
sha256sums_x86_64=('28a3d0a334559e1d4b0bc36e0ac90e44a20654b64512a898af0ad42472bb1156')
sha256sums_aarch64=('c7637ca29642f4305d0d1462d177e66f7962de7bcd1847588fa38a8b8720d72b')
sha256sums=('62dfff25f9bdae4769f4201ed30e7c2bfca54611bee75512c5626e74c764f46e')

package(){
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "${pkgname/-bin/}-$CARCH" "$pkgdir/usr/bin/wings"
 install -D -m 644 "${pkgname/-bin/}.service"   "$pkgdir/usr/lib/systemd/system/${pkgname/-bin/}.service"
}
