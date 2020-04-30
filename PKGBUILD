# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=codelobster
pkgver=1.8.0
pkgrel=1
pkgdesc='Free cross-platform IDE for PHP/HTML/CSS/JavaScript development'
arch=('x86_64')
url="http://www.codelobster.com"
license=('custom')
provides=('codelobster-ide')
source=("${pkgname}-${pkgver}.rpm::http://codelobsteride.com/download/codelobsteride-${pkgver}-1.x86_64.rpm")
options=('!strip')
sha256sums=('19a0e1a5163782cc36367b78e14da6f053965ef5e636be88955ad91e15652d81')

package() {
 mv "${srcdir}/opt" "${pkgdir}"
 mv "${srcdir}/usr" "${pkgdir}"
 rm "${pkgdir}/usr/bin"/code*
 ln -s /opt/codelobsteride/CodeLobsterIDE "${pkgdir}/usr/bin/codelobster"
 sed -i '4s|IDE|\ IDE|' "${pkgdir}/usr/share/applications/codelobsteride.desktop"
 sed -i '7s|.*|Exec=codelobster|' "${pkgdir}/usr/share/applications/codelobsteride.desktop"
 sed -i "6s|.*|Comment=$pkgdesc|" "${pkgdir}/usr/share/applications/codelobsteride.desktop"
}
# vim:set ts=2 sw=2 et: