# Maintainer: Energetix/Dark Nebula
# shellcheck disable=SC2034,SC2154
pkgname=festival-systemd
pkgver=1.0
pkgrel=1
pkgdesc='Systemd unit setting a Festival Service for Speech Dispatcher'
arch=(any)
url='https://www.cstr.ed.ac.uk/projects/festival/'
license=(0BSD)
depends=(festival-freebsoft-utils)
options=(!strip !debug)
install=festival-systemd.install

package() {
install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/festival.service" <<EOF
[Unit]
Description=Festival speech synthesis server
[Service]
ExecStart=/usr/bin/festival --server
Type=simple
[Install]
WantedBy=default.target
EOF
}
