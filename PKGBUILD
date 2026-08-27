# Maintainer: robertfoster
pkgname=netsukuku-rs-bin
pkgver=0.1.2 # renovate: datasource=github-releases depName=M0Rf30/netsukuku-rs
pkgrel=1
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
sha256sums=('efd4fa387722f09d2e731d9508bcaf3d1275fb04cb04d52561df62d2f6a08a31'
  'bdaeb4e4bd1bb6738e2ca46380e8fbea55fed2b04f52d035297f8d78753ee1ac')

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
