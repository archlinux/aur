# Maintainer: Sherlock Holo <sherlockya at gmail dot com>
# Contributor: Can Celasun <can [at] dcc [dot] im>

pkgbase=canta-theme-git
_pkgname=canta-theme
pkgname=('canta-gtk-theme-git' 'canta-icon-theme-git')
pkgdesc="Flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell"
pkgver=2018.10.30.r13.5e3a48c
pkgrel=1
arch=('any')
url="https://github.com/vinceliuice/Canta-theme"
license=('GPL2')
depends=('numix-circle-icon-theme-git'
            'gtk-engine-murrine'
            'gtk-engines'
            'gnome-themes-standard'
            'sassc')
makedepends=('gtk3' 'git')

source=("${_pkgname}::git+https://github.com/vinceliuice/Canta-theme.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

package_canta-gtk-theme-git() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes"
  ./install.sh -b -d "${pkgdir}/usr/share/themes"
}

package_canta-icon-theme-git() {
    pkgdesc="Flat icons for Canta GTK theme"

    mkdir -p "${pkgdir}"/usr/share/icons/Canta
    cp "${srcdir}"/${_pkgname}/src/icons/Canta/* "${pkgdir}"/usr/share/icons/Canta -R
}
