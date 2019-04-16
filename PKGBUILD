# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=fisher
pkgver=3.2.9
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
sha512sums=('cac0e9b3913721be6538a346ec82167732e333b4edcba515a72595977f734c15fade447fc52191451120074f561b9d4cac1589220b802fdfac53a0ead7e9b303')

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
