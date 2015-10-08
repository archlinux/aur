# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=3f97691234d1688ad54b94d9b81f9ef181b0d8e9
_repo=papirus-pack-kde
pkgname=papirus-icon-theme
pkgver=20151004
pkgrel=2
pkgdesc="Modified and adaptive Paper icon theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('87e2b1cbb0e08588a231d5c2638926de7ba566c5c0df81f4a897f95b54957f63')

package() {
    install -d ${pkgdir}/usr/share/icons
    install -d ${pkgdir}/usr/share/apps/amarok/icons/papirus
    install -d ${pkgdir}/usr/share/apps/amarok/icons/papirus-black-panel
    install -d ${pkgdir}/usr/share/apps/amarok/icons/papirus-dark
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus* ${pkgdir}/usr/share/icons/
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus/extra-icons/amarok/* ${pkgdir}/usr/share/apps/amarok/icons/papirus/
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus-black-panel/extra-icons/amarok/* ${pkgdir}/usr/share/apps/amarok/icons/papirus-black-panel/
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus-dark/extra-icons/amarok/* ${pkgdir}/usr/share/apps/amarok/icons/papirus-dark/
    install -D -m644  ${srcdir}/${_repo}-${_git}/icons/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 