pkgname=lyse
pkgver=r11.efe764e
pkgrel=2
pkgdesc="Realtime TUI lyrics for your favorite songs, directly in the terminal."
arch=('any')
url="https://github.com/snoowfall/lyse"
license=('AGPLv3')
depends=('python' 'playerctl')
source=("$pkgname::git+https://github.com/snoowfall/lyse.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir/$pkgname/lyse.py" "$pkgdir/usr/bin/lyse"
}
