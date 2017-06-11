# Maintainer: Ivan Wu <2967948168@qq.com>
pkgname=privoxy-adfilter
pkgver=609.ce2ab5e
pkgrel=1
pkgdesc="Privoxy rule to filter web advertisement."
arch=('any')
depends=('privoxy')
url="https://github.com/qwIvan/privoxy-adfilter"
source=("git+https://github.com/qwIvan/$pkgname.git")
md5sums=('SKIP')
install='privoxy-adfilter.install'

pkgver() {
  cd $pkgname
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  install -Dm644 "$srcdir"/$pkgname/*.{action,filter} -t "$pkgdir/etc/privoxy/"
}

# vim:set ts=2 sw=2 et:
