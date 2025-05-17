pkgname="ycwd-git"
_pkgname="ycwd"
pkgver=0.1.0
pkgrel=1
pkgdesc='Helps replace xcwd on Wayland compositors'
arch=('x86_64' 'arm')
url=https://github.com/blinry/ycwd
license=('GPL')
makedepends=('cargo')
provides=('ycwd')
source=("ycwd::git+https://github.com/blinry/ycwd")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
}


package() {
  cd "$srcdir/$_pkgname/target/release"
  install -D -m 0755 ycwd "$pkgdir/usr/bin/$_pkgname"
}
