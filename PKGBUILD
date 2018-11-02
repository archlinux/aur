# Maintainer: Nanda Okitavera <codeharuka.yusa@gmail.com>
pkgname=cornora-git
pkgver=r24.487a335
pkgrel=1
pkgdesc="Simple Hot Corner Launcher for X11"
arch=('any')
url="https://github.com/yuune/cornora"
license=('MIT')
makedepends=('git')
depends=('bash' 'xdotool')
source=("git+https://github.com/yuune/cornora.git")
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