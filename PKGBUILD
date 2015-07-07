# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=speedread-git
pkgver=r26.6d1c5eb
pkgrel=1
pkgdesc="A simple terminal-based open source Spritz-alike."
arch=('i686' 'x86_64')
url="https://github.com/pasky/speedread"
license=('MIT')
makedepends=('git')
provides=('speedread')
conflicts=('speedread')
source=('git://github.com/pasky/speedread.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/speedread"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$srcdir/speedread"
  install -Dm0755 speedread "$pkgdir"/usr/bin/speedread
  install -Dm0644 LICENCE "$pkgdir"/usr/share/licenses/speedread/LICENSE
}
