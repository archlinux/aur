# Maintainer: Ivan Wu <2967948168@qq.com>
pkgname=privoxy-adfilter
pkgver=37.f5882d7
pkgrel=1
pkgdesc="Privoxy rule to filter web advertisement."
arch=('any')
url="https://github.com/qwIvan/privoxy-adfilter"
depends=('dnsmasq')
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
