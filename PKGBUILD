# Maintainer: robertfoster
pkgname=netsukuku-rs-bin
pkgver=0.1.3 # renovate: datasource=github-releases depName=M0Rf30/netsukuku-rs
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
sha256sums=('7f770bece8fdd52a7761951de92c2b5ff45ada09e24d194b2f4cb3b76198c660'
  '6e1802220b9724a2f8fcc33de69732a55d5e3b67f7d74578835bc0e4cfad9330')

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

sha256sums_x86_64=('7b9f86f989f1dc525e7099bd06ff04f36a779b0bf21ae405f564af722a5608c5')
sha256sums_aarch64=('ad3c4097c4e24d0703f146ee6390a6c3d6bcde113b03e5212a3e01525ab174f5')

