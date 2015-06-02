# Maintainer: Tim Jester-Pfadt <t.jp@gmx.de>

pkgname=gnome-shell-extension-atom-dock-git
pkgver=79.f046ff2
pkgrel=1
pkgdesc="A dock extension for gnome-shell as part of Ozon OS"
arch=('any')
url="https://github.com/ozonos/atom-dock"
groups=('gnome-shell-extensions')
license=('GPL3')
source=('git+https://github.com/ozonos/atom-dock.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/atom-dock
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    cd $srcdir/atom-dock
    
    for i in $(find -name "*.js" -o -name "*.json" -o -name "*.css" -o -name "*.xml" -o -name "*.svg")
    do
    	install -Dm 644 $i $pkgdir/usr/share/gnome-shell/extensions/atom-dock@ozonos.org/$i
    done
}
