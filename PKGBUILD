# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Andy Bao <contact at andybao dot me>
# Maintainer: Michell Gailing <gailing.michell at gmail dot com>

pkgname="pterodactyl-wings-bin"
_name="${pkgname/-bin/}"
pkgver=1.12.2
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
sha256sums_x86_64=('e2ed773a18897a285e5f8588c49709bee6b65aa5709356821d8d6949c05a1acb')
sha256sums_aarch64=('c98520464e371a1a63bbeaedf7711669a6a45347195f57adfb89a788defe98d3')
b2sums=('d9afe390fe810ea2b34298d0f53b3fc06033917e35ac1525b1bc905d4835771a6bbbe5383d671576745f4c70b33d5ad08f1ca90d334d0c4a109fda57f76f39c0')
b2sums_x86_64=('6a8dd52132f83b25f43dc82f1d5ebebda72b130c1238d800929bffe839edfb719b4318737e08d6241feb62e9f4479fe709361fb50cd193be9fc23ed06a37aa21')
b2sums_aarch64=('dd3e68a25cf6dfa9b01d3f7fbb58c5190f783392ddd425de1ad796544921c6c30709c73566100886cd2c8309275269f09f4fff0ed72319a5717bcea5af1cbc7b')

package(){
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "$_name-$pkgver"*    "$pkgdir/usr/bin/wings"
 install -D -m 644 "$_name.service"  -t "$pkgdir/usr/lib/systemd/system/"
}
