# Maintainer: Tim Jester-Pfadt <t.jp@gmx.de>

pkgname=gnome-shell-extension-atom-dash-git
pkgver=25.29c3c06
pkgrel=1
pkgdesc="A dash extension for gnome-shell as part of Ozon OS"
arch=('any')
url="https://github.com/ozonos/atom-dash"
groups=('gnome-shell-extensions')
license=('GPL3')
source=('git+https://github.com/ozonos/atom-dash.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/atom-dash
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    cd "$srcdir"/atom-dash

    for i in $(find -name "*.js" -o -name "*.json" -o -name "*.css" -o -name "*.xml" -o -name "*.svg")
    do
    	install -Dm 644 $i $pkgdir/usr/share/gnome-shell/extensions/atom-dash@ozonos.org/$i
    done  
}
