# Maintainer: Matt Warner <mattwarner2@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-one
_PkgName=SpiderOakONE
pkgver=6.1.4
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
sha256sums_x86_64=('3366d38fd055668cc8a86adc914ace8675ba7babfc479f094041707b21c11961')
source_i686=("spideroakone_${pkgver}_i386.deb::https://spideroak.com/getbuild?platform=ubuntu&arch=i386")
sha256sums_i686=('2596520362896a3746a9c7c25e2c967ae3e74c81cf1d7fc4b36336c17577a75e')

package() {
tar -zxf "${srcdir}"/data.tar.gz -C "$pkgdir"/

install -Dm644 "$srcdir"/terms.txt "$pkgdir"/usr/share/licenses/$pkgname/terms.txt

rm -r "$pkgdir"/etc/apt/
rm -r "$pkgdir"/etc/xdg/menus/applications-merged/SpiderOakONE.menu
}
