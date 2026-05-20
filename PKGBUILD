# Maintainer: gustahxn <https://github.com/gustahxn>
pkgname=wallfinder-git
pkgver=r1.abc1234
pkgrel=1
pkgdesc="A terminal-based wallpaper selector for Wayland compositors"
arch=('any')
url="https://github.com/gustahxn/wallfinder"
license=('MIT')
depends=('fzf' 'chafa' 'swaybg' 'libnotify')
makedepends=('git')
provides=('wallfinder')
conflicts=('wallfinder')
source=("git+https://github.com/gustahxn/wallfinder.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/wallfinder"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/wallfinder"
  install -Dm755 wallfinder "$pkgdir/usr/bin/wallfinder"
  install -Dm644 README.md "$pkgdir/usr/share/doc/wallfinder/README.md"
}
