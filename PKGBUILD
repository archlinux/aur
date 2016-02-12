# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=4b016aaf3d6ff32fb67d1dfa45c82f9f4e78f262
_repo=papirus-gtk-icon-theme
pkgbase=papirus-gtk
pkgname=( 'papirus-gtk-icon-theme' )
pkgver=20160212
pkgrel=1
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')

options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('fa46cc7507b4cc0e41d4706372fb3b556cf2d03f5c61db956ef03b2b03d3bf74')

package_papirus-gtk() {
    pkgdesc="Package for modified and adaptive Paper theme for Gnome or any GTK-based DE."
}

package_papirus-gtk-icon-theme() {
    pkgdesc="Modified and adaptive gtk Paper icon theme "
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_repo}-${_git}/Papirus* ${pkgdir}/usr/share/icons/
    install -D -m644  ${srcdir}/${_repo}-${_git}/Papirus-GTK/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 


