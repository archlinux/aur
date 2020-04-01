# Contributor: Stephen Diehl <sdiehl at clarku dot edu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=coffee-script-git
pkgver=2.4.0.r1.gd23919c4
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

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's/-/.r/' | tr - .
}

package() {
  cd ${pkgname%-git}
  npm install --global --user root --prefix "$pkgdir"/usr coffeescript
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
