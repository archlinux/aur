# Maintainer:  Al S <tei8ho.aur.al@ila5.info>
pkgname=imdone-bin
_pkgname=imdone
pkgver=1.19.6
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
sha512sums=('3455590e6d99c4eec6b0b4d0b2915bd3c092db956674a7deb077107c76ac79fa2a885d7af8a4564b0874d7293ae3e7cff847f808889b9b8e2301c1db368b981a'
            'SKIP')
package() {
  install -Dm644 eula "${pkgdir}/usr/share/licenses/${_pkgname}/eula.html"
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
# vim:set ts=2 sw=2 et:
