# Maintainer: FadeMind <fademind@gmail.com>

_git=8af8acb0889692f2a5f5c08398f3ca6b53452360
_basename=zephyrflattr
pkgname=${_basename}-bundle
pkgver=20150328
pkgrel=1
pkgdesc="Bundle a clean and flat theme for KDE4"
arch=('any')
url="https://github.com/FadeMind/${_basename}"
license=('CCPL:by-sa')
depends=('qtcurve-qt4' 'kdebase-workspace')
optdepends=('faenzaflattr-zephyr-icon-theme: recommended icon theme'
            'breeze-obsidian-cursor-theme: recommended cursor theme')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('908c97ee297525bf192edff4aab085f3d6438646156fa663155640d24a343d1c')

package() {
    cd ${srcdir}/${_basename}-${_git}
    find *.colors -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/color-schemes/{}" \;
    find ZephyrFlattr/* -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/apps/desktoptheme/{}" \;
    find ZephyrFlattr.qtcurve -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/QtCurve/{}" \;
    install -Dm644 ${srcdir}/${_basename}-${_git}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}  
