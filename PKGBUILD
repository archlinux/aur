# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=yakuake-skin-breeze-perfect-dark
pkgver=2.0
pkgrel=1
pkgdesc="The perfect Breeze Dark theme for Yakuake"
arch=("any")
url="https://store.kde.org/p/1193435"
license=("GPL")

depends=("yakuake")

source=("https://github.com/noahadvs/yakuake-breeze_perfect_dark/archive/v${pkgver}.tar.gz")
sha512sums=('383f330f0ac01cf7d348c543bf5c4e951b4d444b761940e863f3ca7afd4be5960ca91b170186207f55dc9ca5419a9f3a1928a473bc5955be7e80b6ef4c8da77a')


prepare() {
    mv "yakuake-breeze_perfect_dark-${pkgver}" "breeze-perfect-dark"
    rm -rf "breeze-perfect-dark/customizations" # not needed for final package
}

package() {
    cd ${srcdir}

    find "breeze-perfect-dark"/* -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/yakuake/skins/{}" \;
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    ln -s "/usr/share/yakuake/skins/breeze-perfect-dark/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    ln -s "/usr/share/yakuake/skins/breeze-perfect-dark/LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
