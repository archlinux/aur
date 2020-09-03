# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.10
pkgrel=1
pkgdesc="Offline search engine for manual pages, Arch Wiki, Gentoo Wiki and other documentation."
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
depends=('man' 'fzf' 'ripgrep' 'awk' 'w3m')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d9e784516f803b87094647b0a4af8b0800e2103b807d103f5bf0a9150c2bb764')
backup=('etc/wikiman.conf')
optdepends=('arch-wiki-docs: enable Arch Wiki')

package() {
  cd "${pkgname}-${pkgver}"
  make
  make prefix=${pkgdir} install
}