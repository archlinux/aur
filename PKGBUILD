# Contributor: Stephen Diehl <sdiehl at clarku dot edu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=coffee-script-git
pkgver=2.1.0.1.gffbe51e3
pkgrel=1
pkgdesc='Language that compiles into JavaScript'
arch=('any')
url=http://coffeescript.org
license=('custom')
depends=('nodejs')
makedepends=('npm')
provides=('coffee-script')
conflicts=('coffee-script')
source=(git://github.com/jashkenas/coffee-script.git)
md5sums=('SKIP')
_gitname='coffee-script'

pkgver() {
  cd ${pkgname%-git}
  git describe --tags |sed 's/-/./g'
}

package() {
  cd ${pkgname%-git}
  npm install --global --user root --prefix "$pkgdir"/usr coffeescript
  rm -r "$pkgdir"/usr/etc
  install -Dm644 "$srcdir"/$_gitname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
