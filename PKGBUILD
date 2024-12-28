# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Andy Bao <contact at andybao dot me>

pkgname="pterodactyl-wings-bin"
_name="${pkgname/-bin/}"
pkgver=1.11.13
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
sha256sums_x86_64=('aca5fa45ddf1c10f092c16dd758b920d8a3fa9f91c37aacc62745e72958bf71a')
sha256sums_aarch64=('a3d71e8c67e261fdd287f73dcab98d2a55dbba9ce001794e0006e4ed88fafe6a')
b2sums=('d9afe390fe810ea2b34298d0f53b3fc06033917e35ac1525b1bc905d4835771a6bbbe5383d671576745f4c70b33d5ad08f1ca90d334d0c4a109fda57f76f39c0')
b2sums_x86_64=('79484ba05c61742f867103e11386855ffd8dd8aa707d7d6fa6bcc43f61b02f9ff24522160f8a8a097e16b0c99db7d3dce104f889d388abd199b39d1121862f67')
b2sums_aarch64=('3f2bf544b584dc8d33314f39c961b2f208697d463e90684319bef1c69e6df6800d05e385432d3de8c9381ceda1c45d6f184e3b25ecc55e28f4a958e538eb21f8')

package(){
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "$_name-$pkgver"*    "$pkgdir/usr/bin/wings"
 install -D -m 644 "$_name.service"  -t "$pkgdir/usr/lib/systemd/system/"
}
