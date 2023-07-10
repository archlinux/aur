# Maintainer: Sherlock Holo <sherlockya at gmail.com>
# Maintainer: sQVe <oskargrunning@gmail.com>

pkgname=vimix-gtk-themes-translucent-git
pkgver=r549.b855cd1a
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
            '39e0fbf0d7afa5595703489a51a30ab2df30b14f022b29900f0a1f4a19d94ce9')
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
