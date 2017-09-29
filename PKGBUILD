# Maintainer: Matt Warner <mattwarner001@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-one
_PkgName=SpiderOakONE
pkgver=6.4.0
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
sha256sums_x86_64=('a94d4ad3657d7437ee4ef5b7a5feb2687b78dafab45f94c6cb2fb5f246c9dcfe')
source_i686=("spideroakone_${pkgver}_i386.deb::https://spideroak.com/release/spideroak/deb_x86")
sha256sums_i686=('63252488965c5098d0b0a68be6118276a546ca61ae6ef8495d4db820e3a15319')

package() {
tar -zxf "${srcdir}"/data.tar.gz -C "$pkgdir"/

install -Dm644 "$srcdir"/terms.txt "$pkgdir"/usr/share/licenses/$pkgname/terms.txt

rm -r "$pkgdir"/etc/apt/
rm -r "$pkgdir"/etc/xdg/menus/applications-merged/SpiderOakONE.menu
}
