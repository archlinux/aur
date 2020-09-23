# Maintainer: Pio <xpio at tut dot by>
pkgname=fortune-mod-irk-git
pkgver=r1.5bd929f
pkgrel=1
pkgdesc="Fortune cookies from Irk bitig - Book of omens"
arch=(any)
url="https://repo.or.cz/fortune-mod-irk"
source=("git://repo.or.cz/fortune-mod-irk")
depends=(fortune-mod)
makedepends=(git)
md5sums=('SKIP')
license=('unknown')
install=$pkgname.install

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -D -m644 irk "${pkgdir}/usr/share/fortune/irk"
  install -D -m644 irk.dat "${pkgdir}/usr/share/fortune/irk.dat"
}
