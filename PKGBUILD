# Maintainer: robertfoster
pkgname=netsukuku-rs-bin
pkgver=0.1.4 # renovate: datasource=github-releases depName=M0Rf30/netsukuku-rs
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
  '92e4e2fa58defd6f809bdda8df063e5dc947cb9d71a7df538a06586608b38fb1')

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

sha256sums_x86_64=('f3e873f0b388a53d76b7f7818f1e134bc9586e7f87f94e726c269d400445100a')
sha256sums_aarch64=('43aeff7b152965d29031b28189edbd89de3f5fe6eefd871352aa33d485f773b9')

