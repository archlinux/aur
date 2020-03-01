# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

_pkgname=fisher
pkgname=${_pkgname}
pkgver=3.2.10
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
sha512sums=('3ef7f21b947020521e317fe5996d04e6b730735ab843ce21d0bd0f23884900a036b8996249ea8d187c521067ad8bafbdbba140357bb6d83a85a60e4834590fc0')


package() {
    cd "${_pkgname}-${pkgver}"

    # install fisher into the global fish directory
    install -Dm 644 fisher.fish "${pkgdir}/usr/share/fish/vendor_functions.d/fisher.fish"
    # README and LICENSE
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
