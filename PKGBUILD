# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=fisherman
pkgver=2.12.0
pkgrel=1
pkgdesc="A blazing fast, modern plugin manager for fish"
arch=('any')
url="http://fisherman.sh/"
license=('MIT')
depends=('fish>=2.2.0' 'git')
optdepends=()
makedepends=('git')
conflicts=('fisherman-git')
install=fisherman.install
source=(
"https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
)
sha512sums=('d352f044e3283122e62c3ca8233f8a19c5347fe6715281f57f522fb50e5505cbf69e187d25f19d645c2b16337e61539d4b637a363ee026e68fce0bb06d39eb78')

package() {
  sharepath="${pkgdir}/usr/share"
  fishpath="${sharepath}/fish"
  # install Fisherman into the global fish directory
  cd "${pkgname}-${pkgver}"
  install -Dm 644 fisher.fish "${fishpath}/functions/fisher.fish"
  # README and LICENSE
  install -Dm 644 LICENSE "${sharepath}/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${sharepath}/doc/${pkgname}/README"
}
