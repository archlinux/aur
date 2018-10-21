# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=fisher
pkgver=3.1.1
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
    "05ac9ac51b2df4f0525dcac80a85c8e6b31ac12ea70da2e4bbe4a5a2cf22f472309fd97b0bbf0ae56f0673635fd4485712cfcc212e17022b801990b2c306e02a"
)

package() {
  sharepath="${pkgdir}/usr/share"
  fishpath="${sharepath}/fish"
  # install Fisherman into the global fish directory
  cd "${pkgname}-${pkgver}"
  install -Dm 644 fisher.fish "${fishpath}/vendor_functions.d/fisher.fish"
  # README and LICENSE
  install -Dm 644 LICENSE.md "${sharepath}/licenses/${pkgname}/LICENSE.md"
  install -Dm 644 README.md "${sharepath}/doc/${pkgname}/README"
}
