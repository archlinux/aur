# Maintainer: orumin <dev@orum.in>

_gitname=OS-X-El-Capitan
pkgname=osx-el-capitan-theme-git
pkgdesc="Theme mimics OS X 10.11 El Capitan for GTK3 and some DEs (GNOME Shell, Xfce, Cinnamon)"
pkgver=v0.7.r0.g9bf29e5
pkgrel=2
arch=('any')
url="https://github.com/Elbullazul/${_gitname}"
source=("git+${url}")
depends=('gtk-engine-murrine' 'gtk-engines')
makedepends=('git')
optdepends=('gnome-themes-standard: Required for the GTK3 theme')
license=('GPL3')
conflicts=('gnome-shell-theme-osx-el-capitan')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_gitname}"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
