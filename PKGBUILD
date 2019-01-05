# Maintainer: Matt Warner <mattwarner001@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-one
_PkgName=SpiderOakONE
pkgver=7.3.0
pkgrel=2
pkgdesc="Secure file backup, sync and sharing client. This provides the client for SpiderOakONE."
arch=('x86_64')
url="https://spideroak.com/"
license=('custom')
depends=('glibc>=2.9' 'desktop-file-utils')
makedepends=()
provides=('spideroak')
conflicts=('spideroak-beta' 'spideroak')
replaces=('spideroak')
options=('!strip')
install=${pkgname}.install
source=("SpiderOakONE_${pkgver}_${pkgrel}_amd64.deb::https://spideroak.com/release/spideroak/deb_x64"
	'terms.txt')
sha256sums=('f857288b34e29ed1c81adc5b1b9ca9cfb97ef4f0bea708f19f891c6e2d91913f'
	    'ee0d1c8c41e95ba2a11de4fe5cf0d89e2b237afc86dc411f58f3b388db8198e9')

package() {
tar -Jxf "${srcdir}"/data.tar.xz -C "$pkgdir"/

install -Dm644 "$srcdir"/terms.txt "$pkgdir"/usr/share/licenses/$pkgname/terms.txt

rm -r "$pkgdir"/etc/apt/
rm -r "$pkgdir"/etc/xdg/menus/applications-merged/SpiderOakONE.menu
}
