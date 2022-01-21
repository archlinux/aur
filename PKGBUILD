# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Andy Bao <contact at andybao dot me>

pkgname="pterodactyl-wings-bin"
pkgver=1.5.5
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
sha256sums_x86_64=('1ed87ffc761792740da09ffd3ce13dd7001fe2139b28f9d76a5535ae5ef96dda')
sha256sums_aarch64=('bdfcf2e74f1a68cf259b20d0acad297ca36f369241fb4ca3da735ed743fb9ffd')
sha256sums=('62dfff25f9bdae4769f4201ed30e7c2bfca54611bee75512c5626e74c764f46e')

package(){
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "${pkgname/-bin/}-$CARCH" "$pkgdir/usr/bin/wings"
 install -D -m 644 "${pkgname/-bin/}.service"   "$pkgdir/usr/lib/systemd/system/${pkgname/-bin/}.service"
}
