# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=cmus-status-scrobbler-git
_name=cmus-status-scrobbler
pkgver=r95.1ca0983
pkgrel=1
pkgdesc="Standalone scrobbler program, not a continuously running process, written in Python 3 that works together with cmus."
url="https://github.com/vjeranc/cmus-status-scrobbler"
arch=("x86_64" "i686" "aarch64")
license=("GPL3")
depends=("cmus" "python")
makedepends=("git")
source=("git+https://github.com/vjeranc/cmus-status-scrobbler")
b2sums=("SKIP")
install=cmus-status-scrobbler.install

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_name
  install -Dm755 cmus_status_scrobbler.py "$pkgdir"/usr/bin/cmus_status_scrobbler
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 cmus_status_scrobbler.ini -t "$pkgdir"/usr/share/$_name/
}
