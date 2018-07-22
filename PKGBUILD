# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=pylnker-git
_pkgname=pylnker
pkgver=r9.3ee2854
pkgrel=2
pkgdesc="A tool to parse Windows .lnk files."
url="https://github.com/HarmJ0y/pylnker"
depends=('python2')
makedepends=('git')
conflicts=(pylnker)
license=('GPL')
arch=('any')
source=("${pkgname}"::'git+https://github.com/HarmJ0y/pylnker.git')
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${pkgname}
  sed -i '1s/python/python2/' pylnker.py
  install -Dm755 "pylnker.py" "$pkgdir/usr/bin/pylnker"
}

# vim:set ts=2 sw=2 et:
