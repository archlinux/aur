# Maintainer: Matt Warner <mattwarner001@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-one
_PkgName=SpiderOakONE
pkgver=7.2.0
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
sha256sums_x86_64=('6d745db2772feefa4ef80e589b8172c6c396c4e2b68fc4d961dac5661baeddd0')
source_i686=("SpiderOakONE_${pkgver}_${pkgrel}_i386.deb::https://spideroak.com/release/spideroak/deb_x86")
sha256sums_i686=('434d5b9484bb6b665e9b1ca172420d4d93a52a08490c57fa9bf9866236eb6cfd')

package() {
tar -zxf "${srcdir}"/data.tar.gz -C "$pkgdir"/

install -Dm644 "$srcdir"/terms.txt "$pkgdir"/usr/share/licenses/$pkgname/terms.txt

rm -r "$pkgdir"/etc/apt/
rm -r "$pkgdir"/etc/xdg/menus/applications-merged/SpiderOakONE.menu
}
