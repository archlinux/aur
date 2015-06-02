# Maintainer: Tim Jester-Pfadt <t.jp@gmx.de>

pkgname=gnome-shell-theme-ozon-git
pkgver=51.c2293ac
pkgrel=1
pkgdesc="A gnome-shell theme as part of Ozon OS"
arch=('any')
url="https://github.com/ozonos/ozon-shell"
groups=('gnome-shell-extensions')
license=('GPL3')
depends=('gnome-shell')
source=('git+https://github.com/ozonos/ozon-shell.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/ozon-shell
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    cd $srcdir/ozon-shell
    
    mkdir -p ${pkgdir}/usr/share/themes/Ozon
    cp -r gnome-shell ${pkgdir}/usr/share/themes/Ozon/
    chmod -R 755 ${pkgdir}/usr/share/themes/Ozon
}
