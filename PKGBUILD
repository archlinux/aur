pkgname=plasma-ptt-git
pkgver=r17.20dd5cb
pkgrel=1
pkgdesc="A Wayland-compatible Push-to-Talk background daemon designed for KDE Plasma and PipeWire."
arch=('any')
url="https://github.com/fativi/plasma-ptt"
license=('GPL3')
depends=('python-pyqt6' 'python-evdev')
makedepends=('git')
provides=('plasma-ptt')
conflicts=('plasma-ptt')
source=("$pkgname::git+https://github.com/fativi/plasma-ptt.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

