# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

_pkgname=fisher
pkgname=${_pkgname}
pkgver=4.0.0
pkgrel=2
pkgdesc="A package manager for the fish shell"
arch=(any)
url="https://github.com/jorgebucaran/fisher"
license=("MIT")
depends=("fish>=2.3.0" "curl" "git")
provides=("$_pkgname")
conflicts=("$_pkgname")
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jorgebucaran/fisher/archive/${pkgver}.tar.gz")
sha512sums=('a945093731c8af37c264d0cfb56c8241bac308e06c9c0369293017eb45ba723ef6df2be0f77b5eccd9d343e4d32d10e2303f828ebfb0a5bd08e46326f9e949e7')


package() {
    cd "${_pkgname}-${pkgver}"

    # install fisher into the global fish directory
    install -Dm 644 fisher.fish "${pkgdir}/usr/share/fish/vendor_functions.d/fisher.fish"
    install -Dm 644 completions/fisher.fish "${pkgdir}/usr/share/fish/vendor_completions.d/fisher.fish"
    # README and LICENSE
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
