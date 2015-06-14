# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
_pkgname=gophcatch
pkgname=$_pkgname-git
pkgver=15.03
pkgrel=1
pkgdesc="Watch gopher holes and catch updates"
arch=('any')
url="https://github.com/vain/gophcatch"
license=('custom:PIZZA-WARE')
depends=('curl')
makedepends=('git')
optdepends=(
  'lynx: Needed if you want to dump new items'
  'cron: Recommended if you want to regularly run gophcatch'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git://github.com/vain/gophcatch.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g; s|v||'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 gophcatch "$pkgdir"/usr/bin/gophcatch
  install -Dm644 man1/gophcatch.1 "$pkgdir"/usr/share/man/man1/gophcatch.1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 gocrc-example \
    "$pkgdir"/usr/share/doc/gophcatch/gocrc-example
}

# vim:set ts=2 sw=2 et:
