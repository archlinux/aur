# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

_pkgname=fisher
pkgname=${_pkgname}
pkgver=3.3.1
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
sha512sums=('5d4387c90fb4451ad3559935db22ecf3516b54a5a8bd9b3a7c66aa6572118b30ee543c1cd82f46bae85eedb331ec70b5c2e7e33e2af397ba5c12af6b0aa2152e')


package() {
    cd "${_pkgname}-${pkgver}"

    # install fisher into the global fish directory
    install -Dm 644 fisher.fish "${pkgdir}/usr/share/fish/vendor_functions.d/fisher.fish"
    # README and LICENSE
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
