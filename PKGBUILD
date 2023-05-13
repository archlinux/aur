pkgname=passcraft
pkgver=1.1.9
pkgrel=1
pkgdesc="Password Profiler using Target's personal information."
arch=('x86_64')
url="https://github.com/thehackersbrain/passcraft"
license=('MIT')
depends=('rust' 'cargo')
makedepends=('git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/passcraft "$pkgdir/usr/bin/passcraft"
}
