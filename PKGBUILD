# Maintainer: Szymon Scholz szymonscholz at gmail dot com
# Archival package, sources accessible only via archive.org

pkgname=ar-smileys
_pkgname=ar-smiles
pkgver=1.9b
_pkgver=1.9
pkgrel=2
pkgdesc="AkiRoss Smileys (for Pidgin and Kopete)"
url="http://www.ale-re.net"
arch=('any')
license=('custom')
install=${pkgname}.install
source=("https://web.archive.org/web/20120204163000/http://www.ale-re.net/downloads/ar-smiles-1.9b.tar.gz")
sha256sums=('94d28cb7059dcbc762627f7365c0657505cd9ed3913fb2d054f2dc65610d574f')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  sed -i "s/^Name=ar-smiles/Name=${pkgname}/" theme
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  install -d "${pkgdir}/usr/share/emoticons/${pkgname}"
  install -m644 * "${pkgdir}/usr/share/emoticons/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
