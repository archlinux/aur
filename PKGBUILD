# Maintainer: joel <aullidolunar at gmai1 d0t c0m>
# Maintainer: orumin <dev@orum.in>

_gitname=OS-X-El-Capitan
pkgname=osx-el-capitan-theme-git
pkgdesc="Theme mimics OS X 10.11 El Capitan for GTK3 and some DEs (GNOME Shell, Xfce, Cinnamon)"
pkgver=v1.2
pkgrel=0
arch=('any')
url="https://github.com/Elbullazul/${_gitname}"
source=('https://github.com/B00merang-Project/macOS-Sierra/archive/master.zip')
depends=('gtk3>=3.18' 'gtk-engine-murrine' 'gtk-engines')
optdepends=('gnome-themes-standard: Required for the GTK3 theme')
license=('GPL3')
conflicts=('gnome-shell-theme-osx-el-capitan')
sha256sums=('e3c8aca3b518855b0f9034bcbf91a0fef0ef785ebf34fa79553b375dc93cc277')

package() {
	mkdir -p "$pkgdir/usr/share/backgrounds"
    cd "$srcdir/macOS-Sierra-master"
    mv 'Wallpaper.jpg' "$pkgdir/usr/share/backgrounds"
    find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/OS-X-El-Capitan/{}" \;
}
