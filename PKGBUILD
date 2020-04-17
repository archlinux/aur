# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: FadeMind <fademind@gmail.com>

_pkgname=yakuake-nord-breeze
pkgname=yakuake-skin-nord-breeze
pkgver=1.0.0
pkgrel=1
pkgdesc="Yakuake Theme based on Breeze and Nord Color Themes"
arch=("any")
url="https://gitlab.com/Scrumplex/yakuake-nord-breeze"
license=("GPL3")

depends=("yakuake")

source=("https://gitlab.com/Scrumplex/yakuake-nord-breeze/-/archive/${pkgver}/yakuake-nord-breeze-${pkgver}.tar.gz")
sha512sums=('9f37129968aad5b1f136903b1274a24091c1db974519c6cab8f766b1e8cb9ec1a7a384cdcac56a17bdd3e3b5ec4014dd5c892388db7f2450a1832f1e2e99d355')


package() {
    cd "${_pkgname}-${pkgver}"

    find * -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/yakuake/skins/${_pkgname}/{}" \;
    install -d "${pkgdir}/usr/share/doc/${_pkgname}" "${pkgdir}/usr/share/licenses/${_pkgname}"
    ln -s "/usr/share/yakuake/skins/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    ln -s "/usr/share/yakuake/skins/${_pkgname}/AUTHORS" "${pkgdir}/usr/share/licenses/${_pkgname}/AUTHORS"
}
