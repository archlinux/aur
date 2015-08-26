_pkgname=graudit
pkgname=graudit-git
pkgver=1440543599
pkgrel=1
pkgdesc="Grep rough source code auditing tool."
arch=(any)
makedepends=('git')
url="https://github.com/wireghoul/graudit"
license=('GPL')
provides=('graudit')
conflicts=('graudit')

source=('git://github.com/wireghoul/graudit.git#branch=master')
sha512sums=('SKIP')

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git log -n1 --pretty=format:%ct
}

build() {
  cd -- "$srcdir/$_pkgname"
  ./configure --prefix "$pkgdir/usr/bin" --dbdir "$pkgdir/usr/share/graudit"
  make
}

package() {
  cd -- "$srcdir/$_pkgname"
  make install
}
