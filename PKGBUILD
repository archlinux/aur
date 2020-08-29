# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.2
pkgrel=2
pkgdesc="Offline search engine for ArchWiki and manual pages combined"
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
depends=('man' 'arch-wiki-docs' 'fzf' 'ripgrep' 'awk' 'xdg-utils' 'w3m')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b729aea52c8e5e943e7e817359af2fc887ea6817c5f8a10a705f498fbe94a194')
# validpgpkeys=('DC9CC1294EAB98FA685FCD3520DF9FC9E4DF2430')

package() {

  cd "${pkgname}-${pkgver}"
  
  install -Dm 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 "${pkgname}.1.man" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

}
