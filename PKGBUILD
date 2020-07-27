# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

_pkgname=fisher
pkgname=${_pkgname}
pkgver=3.2.12
pkgrel=1
pkgdesc="A package manager for the fish shell"
arch=(any)
url="https://github.com/jorgebucaran/fisher"
license=("MIT")
depends=("fish>=2.3.0" "curl" "git")
provides=("$_pkgname")
conflicts=("$_pkgname")
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jorgebucaran/fisher/archive/${pkgver}.tar.gz")
sha512sums=('2e0f6a24c28f277bd1023444dd239f0ed71b5ff97aac5f4f1bbce9520aa4e4fef23f9a887ae2a485f582ea0b94971891edd94f15477e03a21b487737a43aa385')


package() {
    cd "${_pkgname}-${pkgver}"

    # install fisher into the global fish directory
    install -Dm 644 fisher.fish "${pkgdir}/usr/share/fish/vendor_functions.d/fisher.fish"
    # README and LICENSE
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
