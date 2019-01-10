# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=fisher
pkgver=3.2.2
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
    "2f068a8ea4a354d3442afa849092ff17e1374714f4bfb72f70409e733d8bebf95a6aed5ef8c41b8c08b16b9a343ff08ca54e14d6d06472d8fbc0f216aa85e900"
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
