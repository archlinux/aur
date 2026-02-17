# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=http-remote-pc-control
pkgver=3.0.3
PACKAGER="Andrew Koidan <deathangel908@gmail.com>"
tag=v3.0.3
pkgrel=1
pkgdesc="HTTP remote PC control tool"
arch=('x86_64')
url="https://github.com/akoidan/http-remote-pc-control"
license=('MIT')
depends=(
  'libxtst'
  'xcb-util-wm'
  'dbus'
)
optdepends=(
  'openssl: generate TLS certificates on first start'
)
install=http-remote-pc-control.install

source=(
  "http-remote-pc-control-${tag}::${url}/releases/download/${tag}/http-remote-pc-control.elf"
  "openapi.json-${tag}::${url}/releases/download/${tag}/openapi.json"
  "http-remote-pc-control.service"
  "http-remote-pc-control.install"
)
options=(!strip)
sha256sums=('bb42642f21962ac6035a9c8163a832185a269c583e8e32fe65181d48e0010338'
            '928b9d28d09c2857b697a357933258ac787ddebd7a90f66303d385f001cf4cc6'
            'f5b8e817f353a11cd41f8ca9832f19ee7a589d196c1bd70e02f66634337e1de3'
            'a75e2cf6c74cc74e82ffd8c83d4942967025b2853f4e3a146f8a1244426b0171')

package() {
  install -D -m755 "${srcdir}/http-remote-pc-control-${tag}" "${pkgdir}/usr/bin/http-remote-pc-control"
  install -D -m644 "${srcdir}/openapi.json-${tag}" "${pkgdir}/usr/share/http-remote-pc-control/openapi.json"
  install -D -m644 "${srcdir}/http-remote-pc-control.service" "${pkgdir}/usr/lib/systemd/user/http-remote-pc-control.service"
}
