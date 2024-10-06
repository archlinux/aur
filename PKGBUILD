# Maintainer: teraflops cprieto.ortiz@gmail.com

pkgname=mympc-git
pkgver=r0.0
pkgrel=1
pkgdesc="An mpc wrapper with zsh library command completion"
arch=('any')
url="https://gitlab.com/teraflops/mympc"
license=('MIT')
depends=('zsh' 'mpc' 'mpd')
makedepends=('git')
provides=('mympc')
conflicts=('mympc')
source=("git+$url.git")
sha256sums=('SKIP')
install="$pkgname.install"

pkgver() {
  cd "$srcdir/mympc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/mympc"
  install -Dm644 "usr/local/share/zsh/site-functions/_mympc" "$pkgdir/usr/local/share/zsh/site-functions/_mympc"
  install -Dm755 "usr/local/bin/mympc" "$pkgdir/usr/local/bin/mympc"
}

