# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Andy Bao <contact at andybao dot me>
# Maintainer: Michell Gailing <gailing.michell at gmail dot com>

pkgname="pterodactyl-wings-bin"
_name="${pkgname/-bin/}"
pkgver=1.12.1
pkgrel=1
pkgdesc="The server control plane for Pterodactyl Panel - binary package"
url="https://pterodactyl.io/"
license=("MIT")
arch=("x86_64" "aarch64")
depends=("docker")
provides=("$_name")
conflicts=("$_name" "pterodactyl-daemon")
options=(!strip)
source=("$_name.service")
source_x86_64=("$_name-$pkgver-amd64::https://github.com/pterodactyl/wings/releases/download/v$pkgver/wings_linux_amd64")
source_aarch64=("$_name-$pkgver-arm64::https://github.com/pterodactyl/wings/releases/download/v$pkgver/wings_linux_arm64")
sha256sums=('62dfff25f9bdae4769f4201ed30e7c2bfca54611bee75512c5626e74c764f46e')
sha256sums_x86_64=('1c572d4dd49b56749aca439d6d57034aed983bdda8cf222ebdb24d239c199dc9')
sha256sums_aarch64=('d4cb31482be751a5242f1107feab6c6c4b1fff9626945c574f481f0c37625d80')
b2sums=('d9afe390fe810ea2b34298d0f53b3fc06033917e35ac1525b1bc905d4835771a6bbbe5383d671576745f4c70b33d5ad08f1ca90d334d0c4a109fda57f76f39c0')
b2sums_x86_64=('041353e0b9fcfcc7534efaef245effae047a57cdce0de3cd2ae8fd0ab6d29507ad4a239050edf73b761da507825870650ae0646b88109b141615cd05c10f4289')
b2sums_aarch64=('d4c84010bc5fcab350d392021028cfcf51b95d9134980106f7f2de86e8e9a7769d7e6e4a35c4acf9c24c2dc9955d72be4e872ad7e781432dd5bc98e3387ac180')

package(){
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "$_name-$pkgver"*    "$pkgdir/usr/bin/wings"
 install -D -m 644 "$_name.service"  -t "$pkgdir/usr/lib/systemd/system/"
}
