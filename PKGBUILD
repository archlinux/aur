# Maintainer: Scarecrow928 <yushuaibin999 at gmail dot com>

pkgname=dracula-gtk-theme-full
_pkgname=${pkgname%-full}
pkgver=v4.0.0
pkgrel=1
pkgdesc="Dark theme for GTK"
arch=("any")
url="https://github.com/dracula/gtk"
license=('GPL')
makedepends=(git)
optdepends=('ttf-roboto: primary font face defined'
	'ttf-ubuntu-font-family: secondary font face defined'
	'cantarell-fonts: tertiary font face defined')
source=("$_pkgname::git+$url.git#tag=$pkgver")
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)
_filenames=(
    assets
    cinnamon
    gnome-shell
    gtk-2.0
    gtk-3.0
    gtk.3.20
    gtk-4.0
    kde
    metacity-1
    unity
    xfwm4
    LICENSE
    README.md
    index.theme
)
_install_prefix=$pkgdir/usr/share/themes/Dracula

package() {
    cd $srcdir
    mkdir -p $_install_prefix
    for filename in "${_files[@]}"; do
        cp -a $filename $_install_prefix
    done
}