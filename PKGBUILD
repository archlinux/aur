# Maintainer: n0vember <n0vember at half-9 dot net>
pkgname=bash_unit
pkgver=1.2.0
pkgrel=1
pkgdesc="bash unit testing enterprise edition framework for professionals"
arch=('any')
url="https://github.com/pgrange/bash_unit"
license=('GPL')
depends=('bash')
source=(git+https://github.com/pgrange/bash_unit.git)
md5sums=('SKIP')

build() {
  cd "$pkgname"
  git checkout tags/v$pkgver -b v$pkgver
}

package() {
  cd "$pkgname"

  install -Dm755 -o root -g root bash_unit "$pkgdir/usr/bin/bash_unit"

# TODO uncomment this and update pkgver when man is accessible through a release
#  install -dm755 ${pkgdir}/usr/share/man/man1
#  cp -dpr --no-preserve=ownership docs/man/man1/*.1 "$pkgdir/usr/share/man/man1"
}

