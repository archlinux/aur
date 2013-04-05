# Maintainer: Vianney le Clément <vleclement AT gmail· com>
_pkgname=gedit-coffeescript
pkgname=$_pkgname-git
pkgver=1.0.4
pkgrel=1
pkgdesc="gedit Syntax Highlighting for CoffeeScript files"
arch=(any)
url="https://github.com/wavded/gedit-coffeescript"
license=('GPL')
depends=('gtksourceview3')
makedepends=('git')
source=("git://github.com/wavded/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe | sed 's/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 coffee_script.lang "$pkgdir/usr/share/gtksourceview-3.0/language-specs/coffee_script.lang"
  install -Dm644 rubycius-mod.xml "$pkgdir/usr/share/gtksourceview-3.0/styles/rubycius-mod.xml"
}

# vim:set ts=2 sw=2 et:
