# Maintainer: Spiros Georgaras <sng@hellug.gr>
pkgname=ttf-linex-fonts
pkgver=2.2.7
pkgrel=4
pkgdesc="Fonts suitable for education and institutional use"
arch=('any')
license=('GPL2')
url="http://gata.linex.org/trac/browser/fonts-linex/"
depends=('fontconfig' 'xorg-font-utils')
makedepends=('sed' 'binutils')
source=('http://members.hellug.gr/sng/AUR/fonts-linex_2.2-7_all.deb')
md5sums=('d1bf208d3df1efe26718357863c0a016')
install=${pkgname}.install
changelog=ChangeLog

build(){
cd "${srcdir}"
ar xv fonts-linex_2.2-7_all.deb
tar xJf data.tar.xz
sed -i -e 's/Debian GNU.Linux/Arch/' -e 's/GPL-2/GPL2/' ${srcdir}/usr/share/doc/fonts-linex/copyright 
}

package() {
install -d ${pkgdir}/usr/share/fonts/TTF
install -Dm644 ${srcdir}/usr/share/fonts/truetype/linex/*.ttf ${pkgdir}/usr/share/fonts/TTF/
install -d ${pkgdir}/usr/share/licenses/${pkgname}
install -Dm644 ${srcdir}/usr/share/doc/fonts-linex/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
}
