# Maintainer: Tim Jester-Pfadt <t.jp@gmx.de>

pkgname=gnome-shell-extension-atom-panel-git
pkgver=14.129a781
pkgrel=1
pkgdesc="A panel extension for gnome-shell as part of Ozon OS"
arch=('any')
url="https://github.com/ozonos/atom-panel"
groups=('gnome-shell-extensions')
license=('GPL3')
depends=('gnome-shell')
source=('git+https://github.com/ozonos/atom-panel.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/atom-panel
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    cd $srcdir/atom-panel

    for i in $(find -name "*.js" -o -name "*.json" -o -name "*.css" -o -name "*.xml" -o -name "*.svg")
    do
    	install -Dm 644 $i $pkgdir/usr/share/gnome-shell/extensions/atom-panel@numixproject.org/$i
    done
}
