# Maintainer:  Al S <tei8ho.aur.al@ila5.info>
pkgname=imdone-bin
_pkgname=imdone
pkgver=1.19.3
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
sha512sums=('69dd5bda8d8cc5bc2fff5932698d8bd0992932b6ebeac48dd42ad0a11580151d967cf3133d38f6bb83bdf74612dccbb99cccc0d6f1f4ede163c6070da24e6a97'
            '6fde80e28b87d6fb0f4c370f7dacd8bf1cffdbdd2a5c379a97e872b78575917a267b4caa4a63527a4351751784db56b926dcdb01eab8f83e00d79192f678ebea')
package() {
  install -Dm644 eula "${pkgdir}/usr/share/licenses/${_pkgname}/eula.html"
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
# vim:set ts=2 sw=2 et:
