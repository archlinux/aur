# Maintainer: Sherlock Holo <sherlockya at gmail.com>
# Maintainer: sQVe <oskargrunning@gmail.com>

pkgname=vimix-gtk-themes-translucent-git
pkgver=r605.b86cf48c
pkgrel=1
pkgdesc='A flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell, translucent version'
url='https://github.com/vinceliuice/vimix-gtk-themes'
arch=('any')
license=('GPL3')
depends=('gtk3')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gtk-engines: for gtk2 themes')
makedepends=('git')
source=('git+https://github.com/vinceliuice/vimix-gtk-themes.git' 'vimix-gtk4-switch.sh')
sha256sums=('SKIP'
            '28c87592036878a106f77b9e35d98bd6b43c94b387996971b11d47f5a55a6b13')
provides=("vimix-gtk-themes=${pkgver}")
conflicts=('vimix-gtk-themes')
_gitname=vimix-gtk-themes
install=vimix-gtk-themes-translucent-git.install

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_gitname}"
    install -dm755 "${pkgdir}/usr/share/themes"
    install -Dm755 ${srcdir}/vimix-gtk4-switch.sh "${pkgdir}/usr/bin/vimix-gtk4-switch"
    ./install.sh -tweaks translucent -t all -d "$pkgdir/usr/share/themes"
}
