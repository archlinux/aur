# Maintainer: replicadse <haw@voidpointergroup.com>
pkgname=senile
pkgver=0.1.9
pkgrel=1
epoch=
pkgdesc='collecting ToDo statements from files/directories as JSON format'
arch=('x86_64')
url='https://github.com/replicadse/senile'
license=('MIT')
makedepends=(
  'rust'
  'rustup'
  'cargo'
)
provides=('senile')

prepare() {
  #cargo +nightly fetch --locked
  return 0
}

build() {
  #cargo +nightly build --release --frozen --all-targets --target-dir=target
  return 0
}

check() {
  #cargo +nightly test --release --frozed
  return 0
}

package() {
  #install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  cargo +nightly install $pkgname --no-track --all-features --version=$pkgver
}
