# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
pkgname=solana  
pkgver=1.5.19
pkgrel=1
pkgdesc="A fast, secure, and censorship resistant blockchain."
url="https://www.solana.com"
arch=('i686' 'x86_64')
license=('Apache')
depends=()
makedepends=("rustup")
conflicts=("solana-bin")
provides=("solana")
source=("$pkgname-$pkgver.tar.gz::https://github.com/solana-labs/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('5614868eb1f7f1b908b3381c2be84a28')

prepare() {
  rustup update stable
}

build() {
  cd "$pkgname-$pkgver"
  cargo build
  cargo install --path cli --root .
  cargo install --path accounts-bench --root .
  cargo install --path banking-bench --root .
  cargo install --path bench-exchange --root .
  cargo install --path bench-streamer --root .
  cargo install --path bench-tps --root .
  cargo install --path dos --root .
  cargo install --path faucet --root .
  cargo install --path genesis --root .
  cargo install --path gossip --root .
  cargo install --path install --root .
  cargo install --path keygen --root .
  cargo install --path ledger-tool --root .
  cargo install --path log-analyzer --root .
  cargo install --path merkle-root-bench --root .
  cargo install --path net-shaper --root .
  cargo install --path net-utils --root .
  cargo install --path poh-bench --root .
  cargo install --path ramp-tps --root .
  cargo install --path remote-wallet --root .
  cargo install --path scripts --root .
  cargo install --path stake-accounts --root .
  cargo install --path stake-monitor --root .
  cargo install --path stake-o-matic --root .
  cargo install --path sys-tuner --root .
  cargo install --path tokens --root .
  cargo install --path upload-perf --root .
  cargo install --path validator --root .
  cargo install --path watchtower --root .
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm755 $srcdir/$pkgname-$pkgver/bin/* $pkgdir/usr/bin
}
