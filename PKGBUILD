# Maintainer:  Al S <tei8ho.aur.al@ila5.info>
pkgname=imdone-bin
_pkgname=imdone
pkgver=1.54.1
pkgrel=1
pkgdesc="Simple and powerful kanban board that works on top of a local folder of plain text markdown files or code."
arch=('i686' 'x86_64')
provides=('imdone')
url="https://imdone.io/"
license=('custom:imdone')
groups=()
depends=('gtk3' 'nss')
replaces=()
backup=()
options=()
source=("https://imdone.io/downloads/${_pkgname}-${pkgver}.deb"
  'https://imdone.io/eula')
sha512sums=('30f78582f11a8ccd5494c9a95733666218c89876aa1fa4b47e820c51686da0cdfc1054f112f56070157760c857d9b673ae5099f264c779cad613058dcc7d2538'
  'SKIP')
package() {
  install -Dm644 eula "${pkgdir}/usr/share/licenses/${_pkgname}/eula.html"
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
# vim:set ts=2 sw=2 et:
