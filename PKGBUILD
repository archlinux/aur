# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=fisherman
pkgver=2.13.0
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
sha512sums=('300f1e3f13f98e4c65172dafecc3b16031ae8fbfa092161f5eeb91aa12a70787fffc4f4adea145502f4822118d396e518b8ed091033664bad73c651255b13f3e')

package() {
  sharepath="${pkgdir}/usr/share"
  fishpath="${sharepath}/fish"
  # install Fisherman into the global fish directory
  cd "${pkgname}-${pkgver}"
  install -Dm 644 fisher.fish "${fishpath}/functions/fisher.fish"
  # README and LICENSE
  install -Dm 644 LICENSE.md "${sharepath}/licenses/${pkgname}/LICENSE.md"
  install -Dm 644 README.md "${sharepath}/doc/${pkgname}/README"
}
