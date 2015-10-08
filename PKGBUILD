# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=pbin-git
pkgver=r10.adb4784
pkgrel=1
pkgdesc="CLI tool for Stikked based pastebin services"
arch=(any)
url="https://github.xom/glensc/pbin"
license=(GPL2)
makedepends=(git)
depends=(curl)

source=('pbin::git+https://github.com/glensc/pbin')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/pbin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir"/pbin

  install -D -m755 pbin.sh "$pkgdir/usr/bin/pbin"

}

# vim:set ts=2 sw=2 et:
