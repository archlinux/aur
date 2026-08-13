# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Andy Bao <contact at andybao dot me>
# Maintainer: Michell Gailing <gailing.michell at gmail dot com>

pkgname="pterodactyl-wings-bin"
_name="${pkgname/-bin/}"
pkgver=1.13.2
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
sha256sums_x86_64=('93ea7d952b7b847682b090bde2246e6543c2a36d103a8f93329abb94a1c30eaa')
sha256sums_aarch64=('bc14c0d53219445090fd28c256020cf6d7837ca653b74ed0d728153ba8f39c8c')
b2sums=('d9afe390fe810ea2b34298d0f53b3fc06033917e35ac1525b1bc905d4835771a6bbbe5383d671576745f4c70b33d5ad08f1ca90d334d0c4a109fda57f76f39c0')
b2sums_x86_64=('41284ff9eb2526df26a2916439f17e114aa7e925550bc95e8a3c55d37f1a56daf21766c7edf1a63b8219cb24d9b065e34c48752f0cca47730b82f33cb9c47e2f')
b2sums_aarch64=('cd7f49d69a7f9e079dad0e8cea881988e500555d7531e132e7484b929aab202b1759c7515d2d5cc0f44d154d2d0a26f9d1113b66dd60ffd8da63a096983db2e3')

package(){
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "$_name-$pkgver"*    "$pkgdir/usr/bin/wings"
 install -D -m 644 "$_name.service"  -t "$pkgdir/usr/lib/systemd/system/"
}
