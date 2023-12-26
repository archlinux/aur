# Maintainer: Binh Duc Tran <binhtran432k@gmail.com>

pkgname=full-dracula-theme-git
pkgver=2023.12.27.80d5a3f
pkgrel=0
pkgdesc='Dracula Dark Theme for GTK, KDE with Cursor'
url='https://github.com/dracula/gtk'
arch=('any')
license=('GPL')
depends=('kvantum')
conflicts=('dracula-gtk-theme-git'
           'dracula-kde-theme-git'
           'dracula-gtk-theme')
options=('!strip')
_theme='dracula-gtk'
source=('dracula-gtk::git+https://github.com/dracula/gtk.git')
sha256sums=('SKIP')
makedepends=('git')

package() {
    # {{{ themes
    install -d ${pkgdir}/usr/share
    install -d ${pkgdir}/usr/share/icons
    install -d ${pkgdir}/usr/share/themes
    install -d ${pkgdir}/usr/share/color-schemes
    install -d ${pkgdir}/usr/share/plasma
    install -d ${pkgdir}/usr/share/Kvantum
    install -d ${pkgdir}/usr/share/aurorae/themes
    install -d ${pkgdir}/usr/share/sddm/themes

    # Gtk
    cp -r ${srcdir}/${_theme} ${pkgdir}/usr/share/themes/Dracula

    # Kde
    cp -r ${srcdir}/${_theme}/kde/color-schemes/* ${pkgdir}/usr/share/color-schemes
    cp -r ${srcdir}/${_theme}/kde/plasma/* ${pkgdir}/usr/share/plasma
    cp -r ${srcdir}/${_theme}/kde/aurorae/* ${pkgdir}/usr/share/aurorae/themes
    cp -r ${srcdir}/${_theme}/kde/sddm/* ${pkgdir}/usr/share/sddm/themes

    # Kvantum
    cp -r ${srcdir}/${_theme}/kde/kvantum/* ${pkgdir}/usr/share/Kvantum

    # Cursor
    cp -r ${srcdir}/${_theme}/kde/cursors/Dracula-cursors ${pkgdir}/usr/share/icons
    # }}}

    # {{{ privilege
    # Make sure all package true privilege
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
    # }}}
}
# vim:foldmethod=marker
