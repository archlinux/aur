# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Andy Bao <contact at andybao dot me>
# Maintainer: Michell Gailing <gailing.michell at gmail dot com>

pkgname="pterodactyl-wings-bin"
_name="${pkgname/-bin/}"
pkgver=1.13.0
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
sha256sums_x86_64=('927b3311918d66f1bfe09fe57cf29be786344f513840b2f2f472f423de2ef8de')
sha256sums_aarch64=('83b4d3f0131728b654ea96c809de9e75aa26ca187e8da142a79422c76d0e943b')
b2sums=('d9afe390fe810ea2b34298d0f53b3fc06033917e35ac1525b1bc905d4835771a6bbbe5383d671576745f4c70b33d5ad08f1ca90d334d0c4a109fda57f76f39c0')
b2sums_x86_64=('e4c707aa0621b767709d0bcd0fc3e3af8bcf62458b858eef6c70ac1f52bf67a4a7b91d56095c16e7763f99f835393044fd6c2a3001b3b254644b1a1562bba6cd')
b2sums_aarch64=('0d70b5335cf251324ae6af587dd28597552f93f45eff0f049ae16407c4db5c4838f83407f20a8e38ce20f8f0f307bebd2f45fde3f0a0b4385749c7014344fe11')

package(){
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "$_name-$pkgver"*    "$pkgdir/usr/bin/wings"
 install -D -m 644 "$_name.service"  -t "$pkgdir/usr/lib/systemd/system/"
}
