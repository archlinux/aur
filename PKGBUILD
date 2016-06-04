# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=fisherman
pkgver=2.10.0
pkgrel=2
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
sha512sums=('d0834378060f48ef39725ff4ff02e3ecf6ab8116ed40268986be7e7c45d1f989eb1970e2dcb546d6d2a2968deff29aab19d01dc3bd55aceb63b3d126592090cc')

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
