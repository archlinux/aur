# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=http-remote-pc-control
pkgver=3.0.4
PACKAGER="Andrew Koidan <deathangel908@gmail.com>"
tag=v3.0.4
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
sha256sums=('ec2f9a2699c3e4be28088647b572586fab4d256c12af1ce18023e6d770379f45'
            '7a51ddba8ad85e773a0ce2a54f19f6e26ded1403de81c4302299a643c64f547e'
            '12974cfcc3f2dc167d0e2a003a0d23f4cc8f0a9fe60e40d832c0618ee781bedf'
            'a75e2cf6c74cc74e82ffd8c83d4942967025b2853f4e3a146f8a1244426b0171')

package() {
  install -D -m755 "${srcdir}/http-remote-pc-control-${tag}" "${pkgdir}/usr/bin/http-remote-pc-control"
  install -D -m644 "${srcdir}/openapi.json-${tag}" "${pkgdir}/usr/share/http-remote-pc-control/openapi.json"
  install -D -m644 "${srcdir}/http-remote-pc-control.service" "${pkgdir}/usr/lib/systemd/user/http-remote-pc-control.service"
}
