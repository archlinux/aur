# Maintainer: Oliver Ford <dev.aur@ojford.com>
pkgname=bitwarden-systemd
pkgver=1.0.0
pkgrel=1
pkgdesc="Systemd integration for Bitwarden-CLI"

arch=('any')
url="https://github.com/OJFord/bitwarden-systemd"
license=('GPL-3.0-or-later')

depends=(
    'bitwarden-cli'
    'pass'
    'systemd'
)
source=(
    'bw-login.service'
    'bw-session.service'
    'bw-systemd'
    'bw-systemd-set-creds'
)
sha256sums=(
    66a52916b0a53040c908808fae2a88a2553b90fa08d4341cb9a5b8eb23c6d2ab
    f9e448fe6f3a45ff54fae913068968fe3d5de1a0750f24c4479622a76943822f
    d64cf435c36eac2e9cca0b88689c246e1d8f7d4cb4227421e7fb77c996391e6a
    7aac965cf6fc1bd6e114d7dd452c99a5a3b2780e1113f57a9c65df25112ec47b
)

install=${pkgname}.install
package() {
  install -Dm644 bw-login.service "$pkgdir/usr/lib/systemd/user/bw-login.service"
  install -Dm644 bw-session.service "$pkgdir/usr/lib/systemd/user/bw-session.service"
  install -Dm755 bw-systemd "$pkgdir/usr/bin/bw-systemd"
  install -Dm755 bw-systemd-set-creds "$pkgdir/usr/bin/bw-systemd-set-creds"
}
