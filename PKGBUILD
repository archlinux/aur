# Contributor: Stephen Diehl <sdiehl at clarku dot edu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=coffee-script-git
pkgver=1.12.4.4.gca0fd229
pkgrel=2
pkgdesc='Language that compiles into JavaScript'
arch=('any')
url=http://coffeescript.org
license=('custom')
depends=('nodejs')
provides=('coffee-script')
conflicts=('coffee-script')
source=(git://github.com/jashkenas/coffee-script.git)
md5sums=('SKIP')
_gitname='coffee-script'

pkgver() {
  cd "$srcdir"/$_gitname
  git describe --tags |sed 's/-/./g'
}

package() {
  cd $_gitname
  npm install -g --user root --prefix "$pkgdir"/usr
  rm -r "$pkgdir"/usr/etc
  install -Dm644 "$srcdir"/$_gitname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
