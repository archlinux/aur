# Maintainer:  Al S < tei8ho.aur.al@ila5.info>
pkgname=imdone-bin
_pkgname=imdone
pkgver=1.17.6
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
sha512sums=('2d336846f8d9f98f8420af61e60030b1d30eabbbbbe9fe44d57b04e41760d7b36dba46d79ece59b9108debe7c4f4caa651a06b2eec6a056740a8ea11973fc42d'
            'SKIP')
package() {
  install -Dm644 eula "${pkgdir}/usr/share/licenses/${_pkgname}/eula.html"
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
# vim:set ts=2 sw=2 et:
