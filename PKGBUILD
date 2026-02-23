# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=http-remote-pc-control
pkgver=3.1.0
PACKAGER="Andrew Koidan <deathangel908@gmail.com>"
tag=v3.1.0
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
sha256sums=('95f7a2a82aaf63401c476c8003aa6024d032507cb0a52c90f61e85450091c4f9'
            '43b3c672a2c39b6085931631c7211363263e019e8f15bf34ea81de638353518f'
            'b6b805ff081dfd4bfe1272ca23ac93b914dc226949cb7cfea91196a9932f42a1'
            'e469d509cd3f11b0f4245aaa51a3b565bef0b15a4d3cdf18df1cace97a8f362a')

package() {
  install -D -m755 "${srcdir}/http-remote-pc-control-${tag}" "${pkgdir}/usr/bin/http-remote-pc-control"
  install -D -m644 "${srcdir}/openapi.json-${tag}" "${pkgdir}/usr/share/http-remote-pc-control/openapi.json"
  install -D -m644 "${srcdir}/http-remote-pc-control.service" "${pkgdir}/usr/lib/systemd/user/http-remote-pc-control.service"
}
