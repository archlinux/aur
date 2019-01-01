# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=fisher
pkgver=3.2.1
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
    "8d2cc34d99a477dfa046fae594badacdc1c7e3667f5461bf16287a09acea97574903e6c9ad83dec1e1fc37cb5037c0d6702648bda8903c8349c83da5c1f5cf8b"
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
