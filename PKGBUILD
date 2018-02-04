# Maintainer: Matt Warner <mattwarner001@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-one
_PkgName=SpiderOakONE
pkgver=7.0.1
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
sha256sums_x86_64=('80545a30c0f8a838a46b46e72c81fc10a3c365c2fd863471ed64957f9cc3fcf8')
source_i686=("spideroakone_${pkgver}_i386.deb::https://spideroak.com/release/spideroak/deb_x86")
sha256sums_i686=('50b7cf784eb3ee5348c8819b71586826a73554e1b5dd8a352ed8ae4ef464b357')

package() {
tar -zxf "${srcdir}"/data.tar.gz -C "$pkgdir"/

install -Dm644 "$srcdir"/terms.txt "$pkgdir"/usr/share/licenses/$pkgname/terms.txt

rm -r "$pkgdir"/etc/apt/
rm -r "$pkgdir"/etc/xdg/menus/applications-merged/SpiderOakONE.menu
}
