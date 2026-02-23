# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=http-remote-pc-control
pkgver=3.1.1
PACKAGER="Andrew Koidan <deathangel908@gmail.com>"
tag=v3.1.1
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
sha256sums=('c97cb9c1983576f376b9af48a48a1bb0df8a591e87d83b075dc34fd29c7bd4c3'
            'b8a4385595f2ad29b24cd1a1cd5391336f8814559c0264194f8ae629190e663b'
            'b6b805ff081dfd4bfe1272ca23ac93b914dc226949cb7cfea91196a9932f42a1'
            '4532a585abda240273e3244ae5adfafaa6c2492a346de166c13972f66db34f3b')

package() {
  install -D -m755 "${srcdir}/http-remote-pc-control-${tag}" "${pkgdir}/usr/bin/http-remote-pc-control"
  install -D -m644 "${srcdir}/openapi.json-${tag}" "${pkgdir}/usr/share/http-remote-pc-control/openapi.json"
  install -D -m644 "${srcdir}/http-remote-pc-control.service" "${pkgdir}/usr/lib/systemd/user/http-remote-pc-control.service"
}
