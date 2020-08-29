# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.4
pkgrel=2
pkgdesc="Offline search engine for ArchWiki and manual pages combined"
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
depends=('man' 'fzf' 'ripgrep' 'awk' 'w3m')
optdepends=('xdg-utils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('6d0b13d52a1d78a194557b8a8b2a24d5c4d61a43edc37d2f5b7203935b46a4be')
# validpgpkeys=('DC9CC1294EAB98FA685FCD3520DF9FC9E4DF2430')

package() {

  cd "${pkgname}-${pkgver}"
  
  install -Dm 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 "${pkgname}.1.man" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

}
