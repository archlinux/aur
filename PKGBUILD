# Maintainer:  Al S <tei8ho.aur.al@ila5.info>
pkgname=imdone-bin
_pkgname=imdone
pkgver=1.20.5
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
sha512sums=('a7e0f27ebac74dbc524bc4eaa8d706ba5967e4e1b9267b657d873966f6d01a8c9f018cfeedf92c93fd891d99bfd1f896ef8344a364971a78e9a43eb0f0b02a81'
            'SKIP')
package() {
  install -Dm644 eula "${pkgdir}/usr/share/licenses/${_pkgname}/eula.html"
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
# vim:set ts=2 sw=2 et:
