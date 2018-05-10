# Maintainer: Jim Sangwine <jim at sangwine dot net>
# Maintainer: Fernando Vasquez <fmorataya.04 at gmail dot com>

pkgname=gtk-theme-flat-color-git
pkgver=20180507.ff68c61
pkgrel=1
pkgdesc='A flat GTK theme designed to be easily re-colored. This is the theme used in wpgtk.'
arch=('any')
url='https://github.com/deviantfero/wpgtk-templates/tree/master/FlatColor'
license=('LGPL')
depends=()
makedepends=('gtk2'
             'gtk3'
             )
optdepends=('gtk2: GTK+2 theme'
            'gtk3: GTK+3 theme'
            )
provides=('gtk-theme-flat-color-git')
conflicts=('gtk-theme-flat-color-git')
source=('git+https://github.com/deviantfero/wpgtk-templates.git')
sha256sums=('SKIP')

pkgver() {
        cd "wpgtk-templates"
        local date=$(date --date "$(git show -s --format=%ci)" +%Y%m%d)
        local commit=$(git rev-parse --short HEAD)
        echo $date.$commit
}

package() {
    install -dm755 $pkgdir/usr/share/themes
    cp -R wpgtk-templates/FlatColor $pkgdir/usr/share/themes/FlatColor
    rm -rf $pkgdir/usr/share/themes/FlatColor/.git
    printf "\e[32;1m\n* * * * * * * * * * * * * * * * * * * * * * * * * * *\e[0m"
    printf "\e[32;1m\n* To change theme colors edit the following files:  *\e[0m"
    printf "\e[32;1m\n*                                                   *\e[0m"
    printf "\e[32;1m\n* /usr/share/themes/FlatColor/gtk-2.0/gtkrc         *\e[0m"
    printf "\e[32;1m\n* /usr/share/themes/FlatColor/gtk-3.0/gtk.css       *\e[0m"
    printf "\e[32;1m\n* /usr/share/themes/FlatColor/gtk-3.20/gtk.css      *\e[0m"
    printf "\e[32;1m\n* * * * * * * * * * * * * * * * * * * * * * * * * * *\e[0m\n"
}
