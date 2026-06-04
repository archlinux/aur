pkgname=terminal-oscilloscope
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal-based oscilloscope with CRT phosphor physics."
arch=('x86_64')
url="https://github.com/leonyaognev/terminal-oscilloscope.git"
license=('MIT')

depends=('glibc' 'nim')

source=("git+https://github.com/leonyaognev/terminal-oscilloscope.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
