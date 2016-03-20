pkgname=blingbling-git
pkgver=252.a1eec05
pkgrel=1
pkgdesc="Fancy Widgets, Popups and signals for Awesome WM"
arch=('any')
url="https://github.com/cedlemo/blingbling"
license=('GPL2')
depends=('awesome'
         'lua-oocairo-git')
makedepends=('git')
conflicts=('blingbling')
provides=('blingbling')
source=("git://github.com/cedlemo/blingbling.git")
md5sums=('SKIP')

pkgver() {
  cd blingbling
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "$pkgdir/usr/share/awesome/lib/blingbling"
  rm -r blingbling/{doc,config_example,.git*}
  cp -a blingbling "$pkgdir/usr/share/awesome/lib/"
}
