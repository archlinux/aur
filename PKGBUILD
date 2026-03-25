# Maintainer: David Cohen <dacohen@pm.me>

pkgname=localectl-libre
pkgver=0.1.1
pkgrel=1
pkgdesc="Replacement for systemd localectl on systemd-free systems"
arch=('x86_64')
url="https://github.com/osimarr/localectl-libre"
license=('GPL-2.0-or-later')
depends=('glibc' 'dbus')
makedepends=('cargo' 'git')
source=("git+https://github.com/osimarr/localectl-libre.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "localectl-libre"
  cargo build --release
}

package() {
  cd "localectl-libre"
  install -Dm755 "target/release/localectl" "${pkgdir}/usr/bin/localectl"
  install -Dm644 "completions/bash/localectl" "${pkgdir}/usr/share/bash-completion/completions/localectl"
}