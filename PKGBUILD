pkgname=sjnmusic-cli-git
pkgver=r11.f67e43c
pkgrel=1
pkgdesc="CLI client for sjnmusicd HTTP daemon"
arch=('any')
url="https://github.com/serverjonas/SJNmusic"
license=('MIT')
depends=('python' 'sjnmusicd-git')
makedepends=('git')
provides=('sjnmusic-cli')
conflicts=('sjnmusic-cli')

source=("git+https://github.com/serverjonas/SJNmusic.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/SJNmusic"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/SJNmusic"

  install -Dm755 "cli/sjnmusic" "$pkgdir/usr/bin/sjnmusic"
}
