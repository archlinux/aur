# Maintainer: Neuwj <neuwj@linuxmail.org>
pkgname=ftr
pkgver=1.0.0
pkgrel=1
pkgdesc="Generates a directory tree from the current folder and can copy the result to the clipboard"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/Neuwj-00/Foldertree"
license=('GPL3')
depends=('xclip' 'wl-clipboard' 'gcc-libs')
makedepends=('cargo')
source=("Foldertree-$pkgver.tar.gz::https://github.com/Neuwj-00/Foldertree/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "Foldertree-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "Foldertree-$pkgver"
  install -Dm 755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
