# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-gtk-theme-git
_pkgname=deepin-gtk-theme
pkgver=2020.06.10.r34.g773c9f6
pkgrel=1
pkgdesc="Deepin GTK Theme"
arch=('any')
url="https://github.com/linuxdeepin/deepin-gtk-theme"
makedepends=('git')
license=('LGPL3')
optdepends=('gtk-engine-murrine: for gtk2 themes')
groups=('deepin-git')
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+https://github.com/linuxdeepin/deepin-gtk-theme.git")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR="$pkgdir" install
}
