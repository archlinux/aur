# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

_pkgname=fisher
pkgname=${_pkgname}
pkgver=3.3.2
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
sha512sums=('ea2a5615e4eb5180e0c192a26a83a0ee152af04e1a9357ff0487aae4eec686f0344487b6cd919570e111bd5b206d8513246b25154fc5aec3de8f595c14c2e8f2')


package() {
    cd "${_pkgname}-${pkgver}"

    # install fisher into the global fish directory
    install -Dm 644 fisher.fish "${pkgdir}/usr/share/fish/vendor_functions.d/fisher.fish"
    # README and LICENSE
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
