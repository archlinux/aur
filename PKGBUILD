# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
_pkgname=gitary
pkgname=$_pkgname-git
pkgver=17.09.2.g556cebd
pkgrel=1
pkgdesc="A diary using git as its backend"
arch=('any')
url='https://uninformativ.de/git/gitary'
license=('MIT')
makedepends=('git')
depends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://uninformativ.de/git/gitary.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g; s|v||'
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 gitary "$pkgdir"/usr/bin/gitary
  install -Dm644 man1/gitary.1 "$pkgdir"/usr/share/man/man1/gitary.1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
