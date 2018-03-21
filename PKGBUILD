# Maintainer: Matt Warner <mattwarner001@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-one
_PkgName=SpiderOakONE
pkgver=7.1.0
pkgrel=1
pkgdesc="Secure file backup, sync and sharing client. This provides the client for SpiderOakONE."
arch=('i686' 'x86_64')
url="https://spideroak.com/"
license=('custom')
depends=('glibc>=2.9' 'desktop-file-utils')
makedepends=()
provides=('spideroak')
conflicts=('spideroak-beta' 'spideroak')
replaces=('spideroak')
options=('!strip')
install=${pkgname}.install
source=(terms.txt)
sha256sums=('ee0d1c8c41e95ba2a11de4fe5cf0d89e2b237afc86dc411f58f3b388db8198e9')
source_x86_64=("SpiderOakONE_${pkgver}_${pkgrel}_amd64.deb::https://spideroak.com/release/spideroak/deb_x64")
sha256sums_x86_64=('442ed2b5b33399754bec0e25eb9ba5dcac5c9de365384878e0a18206aba76669')
source_i686=("SpiderOakONE_${pkgver}_${pkgrel}_i386.deb::https://spideroak.com/release/spideroak/deb_x86")
sha256sums_i686=('6ae7ce907b3060351576fe358c9a0ea7cc2c13cba788d1dcac7627bcded1d6e9')

package() {
tar -zxf "${srcdir}"/data.tar.gz -C "$pkgdir"/

install -Dm644 "$srcdir"/terms.txt "$pkgdir"/usr/share/licenses/$pkgname/terms.txt

rm -r "$pkgdir"/etc/apt/
rm -r "$pkgdir"/etc/xdg/menus/applications-merged/SpiderOakONE.menu
}
