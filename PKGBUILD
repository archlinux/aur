# Contributor: Stephen Diehl <sdiehl at clarku dot edu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=coffee-script-git
pkgver=1.12.4
pkgrel=1
pkgdesc='Language that compiles into JavaScript'
arch=('any')
url=http://coffeescript.org
license=('custom')
depends=('nodejs' 'underscorejs')
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
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
