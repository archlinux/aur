# Maintainer: Raymond W. Ko <raymond.w.ko {cat} gmail {dog} com>

pkgname=sierra-gtk-theme-git
pkgver=2018.10.12.r39.e95e679
pkgrel=1
pkgdesc="MacOS High Sierra like theme for GTK 3, GTK 2 and Gnome-Shell etc."
arch=('any')
url="https://github.com/vinceliuice/Sierra-gtk-theme"
license=('GPL3')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes')
makedepends=('gtk3' 'sassc' 'git')
conflicts=('sierra-gtk-theme')
replaces=('sierra-gtk-theme')
source=("git+https://github.com/vinceliuice/Sierra-gtk-theme.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/Sierra-gtk-theme"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/Sierra-gtk-theme"
    DST="$pkgdir/usr/share/themes"
    mkdir -p "$DST"
    ./install.sh --dest "$DST"
}
