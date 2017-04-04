# Maintainer: Matt Warner <mattwarner2@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-one
_PkgName=SpiderOakONE
pkgver=6.1.9
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
source_x86_64=("spideroakone_${pkgver}_amd64.deb::https://spideroak.com/getbuild?platform=ubuntu&arch=x86_64")
sha256sums_x86_64=('afb9903925807950a2359cd709ac62733bb678f745ca25ec3426adca783a80b8')
source_i686=("spideroakone_${pkgver}_i386.deb::https://spideroak.com/getbuild?platform=ubuntu&arch=i386")
sha256sums_i686=('6d924327182c72289ed16290dba8e3559284a9f5d8c58b32f8d76364cc970b9f')

package() {
tar -zxf "${srcdir}"/data.tar.gz -C "$pkgdir"/

install -Dm644 "$srcdir"/terms.txt "$pkgdir"/usr/share/licenses/$pkgname/terms.txt

rm -r "$pkgdir"/etc/apt/
rm -r "$pkgdir"/etc/xdg/menus/applications-merged/SpiderOakONE.menu
mv "$pkgdir"/opt/SpiderOakONE/lib/libz.so.1 "$pkgdir"/opt/SpiderOakONE/lib/libz.so.1.bak
ln -s "$pkgdir"/usr/lib/libz.so.1 "$pkgdir"/opt/SpiderOakONE/lib
}
