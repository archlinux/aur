# Maintainer: Nanda Okitavera <codeharuka.yusa@gmail.com>
pkgname=cornora-git
pkgver=r27.8ea76dd
pkgrel=2
pkgdesc="Simple Hot Corner Launcher for X11"
arch=('any')
url="https://github.com/okitavera/cornora"
license=('MIT')
makedepends=('git')
depends=('bash' 'xdotool' 'xorg-xprop')
source=("git+https://github.com/okitavera/cornora.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/cornora"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/cornora"
  install -Dm755 cornora "$pkgdir/usr/bin/cornora"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}