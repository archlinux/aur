# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=fisher
pkgver=3.1.0
pkgrel=1
pkgdesc="A blazing fast, modern plugin manager for fish"
arch=("any")
url="https://github.com/jorgebucaran/fisher"
license=("MIT")
depends=("fish>=2.3.0" "curl" "git")
makedepends=("git")
conflicts=("fisherman" "fisherman-git" "fisher-git")
install=fisher.install
source=(
    "https://github.com/jorgebucaran/fisher/archive/${pkgver}.tar.gz"
)
sha512sums=(
    "876afc3dc0763e0dcce787fd39a66940446417d6ed3b5651bfa95db32b14d07919ec7a8d20dcc5a2b61b627f11627c55e4367dff4d453ca5a292af24acb8ac32"
)

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
