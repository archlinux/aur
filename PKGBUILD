# Maintainer: GI Jack <iamjacksemail@hackermail.com>
_pkgname=sqlmate
pkgname=sqlmate-git
pkgver=r15.2a19430
pkgrel=1
pkgdesc="A friend of SQLmap which will do what you always expected from SQLmap"
arch=('any')
url="https://github.com/UltimateHackers/sqlmate"
license=('GPLv3')
depends=('python2' 'python2-mechanize')
source=("git://github.com/UltimateHackers/sqlmate.git")
sha256sums=('SKIP')
_pyver=$(pacman -Q python | cut -f 2 -d " " |cut -d "." -f 1,2)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm755 "sqlmate" "${pkgdir}/usr/bin/sqlmate"
}

