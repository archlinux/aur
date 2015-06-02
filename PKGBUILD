# Maintainer: Tim Jester-Pfadt <t.jp@gmx.de>

pkgname=gnome-shell-extension-atom-workspaces-git
pkgver=3.b7b715f
pkgrel=1
pkgdesc="A workspaces extension for gnome-shell as part of Ozon OS"
arch=('any')
url="https://github.com/ozonos/atom-workspaces"
groups=('gnome-shell-extensions')
license=('GPL3')
depends=('gnome-shell')
source=('git+https://github.com/ozonos/atom-workspaces.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/atom-workspaces
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    cd $srcdir/atom-workspaces

    for i in $(find -name "*.js" -o -name "*.json" -o -name "*.css" -o -name "*.xml" -o -name "*.svg")
    do
    	install -Dm 644 $i $pkgdir/usr/share/gnome-shell/extensions/atom-workspaces@numixproject.org/$i
    done
}
