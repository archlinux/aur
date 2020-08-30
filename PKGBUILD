# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.5
pkgrel=1
pkgdesc="Offline search engine for ArchWiki and manual pages combined"
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
depends=('man' 'fzf' 'ripgrep' 'awk' 'w3m' 'arch-wiki-docs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('8503ba5cf54cb3d56ebdf7a5786645a31093f7cc16751b53ba6f3deabd8d497e')
# validpgpkeys=('DC9CC1294EAB98FA685FCD3520DF9FC9E4DF2430')
backup=('etc/wikiman.conf')

package() {

  cd "${pkgname}-${pkgver}"
  
  install -Dm 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 "${pkgname}.1.man" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  install -Dm 644 -t "${pkgdir}/etc" 'wikiman.conf'

}
