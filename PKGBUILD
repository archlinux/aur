# Maintainer: Paul Oppenheimer <bepvte@gmail.com>
pkgname=abrus-gtk-theme-git
_pkgname=Abrus-gtk-theme
pkgdesc='Abrus is a stylish Design theme for GTK 3, GTK 2 and Gnome-Shell'
pkgver=30.90db2d5
pkgrel=1
arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
source=('Install.patch'
        'git+https://github.com/vinceliuice/Abrus-gtk-theme.git')
url='https://vinceliuice.github.io/theme-abrus.html'
md5sums=('SKIP'
         'SKIP')
makedepends=('git' 'patch')
pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
build() {
    cd "${srcdir}/${_pkgname}"
    patch Install < "${srcdir}/Install.patch"
}
package() {
    cd "${srcdir}/${_pkgname}"
    install -m755 -d "${pkgdir}/usr/share/themes"
    DEST_DIR="${pkgdir}/usr/share/themes" ./Install
}
