# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
_pkgname=explain
pkgname=$_pkgname-git
pkgver=15.02
pkgrel=1
pkgdesc="Annotate commands using a simple markup language"
arch=('any')
url='http://www.uninformativ.de/projects/?q=explain'
license=('custom:PIZZA-WARE')
depends=('python')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git://github.com/vain/explain.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g; s|v||'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 explain "$pkgdir"/usr/bin/explain
  install -Dm644 man1/explain.1 "$pkgdir"/usr/share/man/man1/explain.1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
