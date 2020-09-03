# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.9
pkgrel=1
pkgdesc="Offline search engine for manual pages, Arch Wiki, Gentoo Wiki and other documentation."
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
depends=('man' 'fzf' 'ripgrep' 'awk' 'w3m')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('5163e61ce6a674486a3ee4d3d1a6dc6de682fdd253afc1ef51508054c41fd2d9')
backup=('etc/wikiman.conf')
optdepends=('arch-wiki-docs: enable Arch Wiki')

package() {
  cd "${pkgname}-${pkgver}"
  make
  make prefix=${pkgdir} install
}