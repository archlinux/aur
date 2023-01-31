# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Andy Bao <contact at andybao dot me>

pkgname="pterodactyl-wings-bin"
pkgver=1.11.2
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
sha256sums_x86_64=('fdabc64bfacbe488c55e712aa5765619d81a4d13cc6a924272d06a601da1d41a')
sha256sums_aarch64=('be2d29afa9e4cc8ddbbe5a70a3e7fb65a61c0f90d68baaa070ddb01d94b89c58')

package(){
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "${pkgname/-bin/}-$CARCH" "$pkgdir/usr/bin/wings"
 install -D -m 644 "${pkgname/-bin/}.service"   "$pkgdir/usr/lib/systemd/system/${pkgname/-bin/}.service"
}
