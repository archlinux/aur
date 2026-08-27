# Maintainer: robertfoster
pkgname=netsukuku-rs-bin
pkgver=0.1.2 # renovate: datasource=github-releases depName=M0Rf30/netsukuku-rs
pkgrel=2
pkgdesc="Rust reimplementation of the Netsukuku mesh routing protocol: QSPN v2, Hooking, Coordinator, PeerServices, ANDNA (prebuilt static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/M0Rf30/netsukuku-rs"
license=('GPL-3.0-or-later')
depends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=('etc/ntkd/ntkd.toml')

source=(ntkd.service
  ntkd.toml)
sha256sums=('0535fc523edaaaa8ce23888d4c3db13500a94988fdb20a5826d59f6da6698810'
  'b16a6805a87698c43a8fdf7bba699ebccf495aa24d110a49a6291bea335e76c0')

package() {
  install -Dm0755 "$srcdir/ntkd" \
    "$pkgdir/usr/bin/ntkd"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/ntkd.service" \
    "$pkgdir/usr/lib/systemd/system/ntkd.service"
  install -Dm644 "$srcdir/ntkd.toml" \
    "$pkgdir/etc/ntkd/ntkd.toml"
}

source_x86_64=("ntkd-${pkgver}-x86_64-unknown-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/ntkd-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("ntkd-${pkgver}-aarch64-unknown-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/ntkd-${pkgver}-aarch64-unknown-linux-musl.tar.gz")

sha256sums_x86_64=('84d951330138beb6af0131218e883aa7bb0f8f9891dd1b76f40593e9de71f126')
sha256sums_aarch64=('567aac4b35e4f9a764be29e930b8360907d328a17418697c84ec20ea414622ec')
