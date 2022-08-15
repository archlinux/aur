# Maintainer: CosmicHorror <LovecraftianHorror@pm.me>

pkgname=inlyne
pkgver=0.1.6
pkgrel=1
pkgdesc='A GPU powered yet browsless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/trimental/$pkgname"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('bd2294516b90fbc32f22e3ce5ea3f617b3b482ca24800c0254e817fb817d6c39f886bc22410af6ace045d2844dd8e53774b3fd4c12263fbd7a4cd3b1af9c6b9c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
