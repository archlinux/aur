# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Andy Bao <contact at andybao dot me>
# Maintainer: Michell Gailing <gailing.michell at gmail dot com>

pkgname="pterodactyl-wings-bin"
_name="${pkgname/-bin/}"
pkgver=1.13.3
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
sha256sums_x86_64=('010d894a895fe4f914e3f1c1e75fb2fda4ebe50cc249e7e456887ea5b422c8fa')
sha256sums_aarch64=('8e3114cb0ee5ec617831d5ec35097b1096c6c972f05ef80c683a9f396d0fe9f5')
b2sums=('d9afe390fe810ea2b34298d0f53b3fc06033917e35ac1525b1bc905d4835771a6bbbe5383d671576745f4c70b33d5ad08f1ca90d334d0c4a109fda57f76f39c0')
b2sums_x86_64=('b114ac98d351a5fbae5efbf6cdd4872f09dce815cb85dea5c8f0455cd4190c0774b78f28f881fe008399d4f82941bdd2d81f97a61119f2c23c71fa6f4f0b4060')
b2sums_aarch64=('42d30ecab1bcdfaefe8ce7493188a3a6c3509c10aca7da6e5143c1130e13aa3aa541c2f33d756ee5fd04348e93e1a7af3f283204220173fbcc9b6d2012befd10')

package(){
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "$_name-$pkgver"*    "$pkgdir/usr/bin/wings"
 install -D -m 644 "$_name.service"  -t "$pkgdir/usr/lib/systemd/system/"
}
