# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=virtualbox-guest-goodies
pkgver=6.1
pkgrel=0
pkgdesc="A collections of goodies for the unix-like VirtualBox quests."
arch=('any')
url="https://gitlab.com/linux-stuffs/virtualbox-guest-goodies"
license=('GPL3')
groups=()

provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('bash' 'grep' 'sed' 'virtualbox-guest-utils' 'xorg-server' 'xorg-xrandr')
optdepends=()
options=('!strip' '!emptydirs')
source=('https://gitlab.com/linux-stuffs/virtualbox-guest-goodies/raw/master/distrib/virtualbox-guest-goodies-6.1-0.tar.gz')
sha256sums=('SKIP')

package() {
	cd ${srcdir}/${pkgname}
	./configure
	make install DESTDIR=${pkgdir}
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
