# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.11
pkgrel=1
pkgdesc="Offline search engine for manual pages, Arch Wiki, Gentoo Wiki and other documentation."
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
depends=('man' 'fzf' 'ripgrep' 'awk' 'w3m')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('cfb85d033c6a91226d655cbfa95ae857be51b9b14151112ca1ac6243c0b03960')
backup=('etc/wikiman.conf')
optdepends=('arch-wiki-docs: enable Arch Wiki')

package() {
  cd "${pkgname}-${pkgver}"
  make
  make prefix=${pkgdir} install
}