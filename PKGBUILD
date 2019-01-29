# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=fisher
pkgver=3.2.7
pkgrel=1
pkgdesc="A package manager for the fish shell"
arch=("any")
url="https://github.com/jorgebucaran/fisher"
license=("MIT")
depends=("fish>=2.3.0" "curl" "git")
makedepends=("git")
conflicts=("fisher-git")
install=fisher.install
source=(
    "https://github.com/jorgebucaran/fisher/archive/${pkgver}.tar.gz"
)
sha512sums=('b6f6ec6ac079a8a72e2866c26ac68411783fba3a5ac80663dec661882c51cd75b6b70ad85622bb4e189fff8dafb39bb704a8b90a5cf5edeab5ee43ff5753a54d')

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
