# Maintainer: GI Jack <iamjacksemail@hackermail.com>
_pkgname=Blazy
pkgname=blazy-git
pkgver=r17.06c2d50
pkgrel=1
pkgdesc="Blazy is a modern login page bruteforcer"
arch=('any')
url="https://github.com/UltimateHackers/Blazy"
license=('GPLv3')
depends=('python2' 'python2-mechanize' 'python2-beautifulsoup4')
source=("git://github.com/UltimateHackers/Blazy.git")
sha256sums=('SKIP')
_pyver=$(pacman -Q python | cut -f 2 -d " " |cut -d "." -f 1,2)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm755 "blazy.py" "${pkgdir}/usr/bin/blazy.py"
}

