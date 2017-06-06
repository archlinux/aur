# Maintainer: Matt Warner <mattwarner2@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-one
_PkgName=SpiderOakONE
pkgver=6.3.0
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
source_x86_64=("spideroakone_${pkgver}_amd64.deb::https://spideroak.com/release/spideroak/deb_x64")
sha256sums_x86_64=('82f39594ac3c5b22324912a633b51a03dd1d6a6b3460bf9426f3bfe712af12e7')
source_i686=("spideroakone_${pkgver}_i386.deb::https://spideroak.com/release/spideroak/deb_x86")
sha256sums_i686=('943b324f1f1daae8fc52e952665a0b8f543f5294e21736a90c94f234a217512b')

package() {
tar -zxf "${srcdir}"/data.tar.gz -C "$pkgdir"/

install -Dm644 "$srcdir"/terms.txt "$pkgdir"/usr/share/licenses/$pkgname/terms.txt

rm -r "$pkgdir"/etc/apt/
rm -r "$pkgdir"/etc/xdg/menus/applications-merged/SpiderOakONE.menu
mv "$pkgdir"/opt/SpiderOakONE/lib/libz.so.1 "$pkgdir"/opt/SpiderOakONE/lib/libz.so.1.bak
ln -s "$pkgdir"/usr/lib/libz.so.1 "$pkgdir"/opt/SpiderOakONE/lib
}
