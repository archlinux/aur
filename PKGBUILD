# Maintainer: willemw <willemw12@gmail.com>

pkgname=dmenu-frecency-git
pkgver=r52.ed3102d
pkgrel=1
pkgdesc="dmenu-based desktop application launcher that uses a combination of frequency and recency. Launches XDG desktop files and executables from PATH."
arch=('any')
url="https://github.com/kspi/${pkgname%-git}"
license=('MIT')
depends=('dmenu' 'python-docopt' 'python-xdg')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$pkgname/${pkgname%-git}" -t "$pkgdir/usr/bin"
}

