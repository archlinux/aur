# Maintainer: Popa Ioan Alexandru <alexioanpopa11@gmail.com>

pkgname=stylish-gtk-theme-git
pkgver=2020.09.12.53664fe
pkgrel=1
pkgdesc="A flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell"
arch=('any')
url="https://github.com/vinceliuice/stylish-gtk-theme"
license=('GPL3')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes')
makedepends=('gtk3' 'sassc' 'git')
#conflicts=('stylish-gtk-theme')
provides=('stylish-gtk-theme')
source=("git+https://github.com/vinceliuice/stylish-gtk-theme.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/stylish-gtk-theme"
    echo "$(git log -1 --format=%cs | sed 's/\-/\./g').$(git log -1 --format=%h)"
}

package() {
    cd "$srcdir/stylish-gtk-theme"
    mkdir -p "$pkgdir/usr/share/themes"
    ./Install --dest "$pkgdir/usr/share/themes"
}

