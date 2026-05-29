# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Andy Bao <contact at andybao dot me>
# Maintainer: Michell Gailing <gailing.michell at gmail dot com>

pkgname="pterodactyl-wings-bin"
_name="${pkgname/-bin/}"
pkgver=1.12.3
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
sha256sums_x86_64=('c0e98c755e5ea52657f851afef26061e75a5ea7ea67e4bb63e58d6fccde59f24')
sha256sums_aarch64=('08e18ecb8d0dc3e72c79b38d97bb846518699865df73ecd45b719061da491d6c')
b2sums=('d9afe390fe810ea2b34298d0f53b3fc06033917e35ac1525b1bc905d4835771a6bbbe5383d671576745f4c70b33d5ad08f1ca90d334d0c4a109fda57f76f39c0')
b2sums_x86_64=('090d463e62714b1fcff556d9bc3cfbc357a9e69403b6066d69a8b100e17dbb068a2446e4a121213fe7bb1939aaa8efc397ce26ccb36ea05e5e09b25918c0006d')
b2sums_aarch64=('9e8bbd5b787af892ea96b4c7a17d8aa844d17a50ecd47ad4d4b67c57b6ecdb0f22f347a718b00d0b0082ce8bf56108c7d19b8b8d88fd7a67450d742424e3494d')

package(){
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "$_name-$pkgver"*    "$pkgdir/usr/bin/wings"
 install -D -m 644 "$_name.service"  -t "$pkgdir/usr/lib/systemd/system/"
}
