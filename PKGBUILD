# Maintainer: FadeMind <fademind@gmail.com>

_git=68f43f51bd9da40e8fcf57ac1f631b65ecfd156b
_pkgname=zephyrflattr
pkgname=${_pkgname}-bundle
pkgver=20150730
pkgrel=1
pkgdesc="Bundle a clean and flat theme for KDE4."
arch=('any')
url="https://github.com/FadeMind/${_pkgname}"
license=('CCPL:by-sa')
depends=(qtcurve-{qt4,qt5,kde4,gtk2,utils} kdebase-workspace)
optdepends=('faenzaflattr-zephyr-icon-theme: recommended icon theme'
            'breeze-obsidian-cursor-theme: recommended cursor theme')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('0e645ca9a21ae53c18b093011cdf747326f5fe9f385b361bf6965f8246e6d7ef')

package() {
    cd ${srcdir}/${_pkgname}-${_git}
    find *.colors -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/color-schemes/{}" \;
    find ZephyrFlattr/* -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/apps/desktoptheme/{}" \;
    find ZephyrFlattr.qtcurve -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/QtCurve/{}" \;
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}  
