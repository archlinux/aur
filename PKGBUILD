# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="systemd-lock-handler"
pkgver=r1.f40a415
pkgrel=1
pkgdesc="Logind lock event to systemd target translation."
arch=('any')
url="https://github.com/hobarrera/systemd-lock-handler"
license=('ISC')
depends=('python2-txdbus')
source=("$pkgname::git+https://github.com/hobarrera/systemd-lock-handler.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/$pkgname

  make DESTDIR="$pkgdir/" install
}
