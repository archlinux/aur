# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Andy Bao <contact at andybao dot me>

pkgname="pterodactyl-wings-bin"
pkgver=1.5.3
pkgrel=1
pkgdesc="The server control plane for Pterodactyl Panel - binary package"
url="https://pterodactyl.io/"
license=("MIT")
arch=("x86_64" "aarch64")
depends=("docker")
makedepends=("go")
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}" "pterodactyl-daemon")
source_x86_64=("${pkgname/-bin/}-$CARCH::https://github.com/pterodactyl/wings/releases/download/v$pkgver/wings_linux_amd64")
source_aarch64=("${pkgname/-bin/}-$CARCH::https://github.com/pterodactyl/wings/releases/download/v$pkgver/wings_linux_arm64")
source=("${pkgname/-bin/}.service")
sha256sums_x86_64=('2c86c4fccd8cdaadd68522a9965eb73105455bc50ebe39d0ff9cf4b14ecd3a2d')
sha256sums_aarch64=('2c86c4fccd8cdaadd68522a9965eb73105455bc50ebe39d0ff9cf4b14ecd3a2d')
sha256sums=('62dfff25f9bdae4769f4201ed30e7c2bfca54611bee75512c5626e74c764f46e')

package(){
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "${pkgname/-bin/}-$CARCH" "$pkgdir/usr/bin/wings"
 install -D -m 644 "${pkgname/-bin/}.service"   "$pkgdir/usr/lib/systemd/system/${pkgname/-bin/}.service"
}
