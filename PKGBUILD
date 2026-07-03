# Maintainer: Neuwj <Neuwj@linuxmail.org>
pkgname=uninstaller
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal and modern terminal package uninstaller written in Rust"
arch=('x86_64')
url="https://github.com/Neuwj-00/uninstaller"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Neuwj-00/uninstaller/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP') # Sürüm yayınladığınızda 'updpkgsums' ile güncelleyin

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --target-dir target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
