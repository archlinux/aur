# Maintainer Tatsuki Tanaka crylaughttt@gmail.com
pkgname=wl-clicker-git
pkgver=0.3.1.r13.gf0241c3 
pkgrel=1
pkgdesc="A simple and insanely fast autoclicker for Wayland (git version)"
arch=('x86_64')
url="https://github.com/phonetic112/wl-clicker"
license=('MIT')
depends=('wayland' 'linux-api-headers')
makedepends=('gcc' 'make' 'wayland-protocols' 'wayland')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/wl-clicker"
  git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/wl-clicker"
  make
}

package() {
  cd "$srcdir/wl-clicker"
  install -Dm755 build/wl-clicker "$pkgdir/usr/bin/wl-clicker"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

