pkgname=socks-relay
pkgver=1.0.1
pkgrel=3
pkgdesc="Simple socks5 server and relay"
arch=('any')
url="https://github.com/guillon/socks-relay"
license=('MIT')
depends=('python-pysocks')
source=(
  "https://github.com/guillon/socks-relay/archive/refs/tags/v${pkgver}.zip"
  "socks-relay.service"
  "socks-relay.conf")
sha256sums=('59e02359aa61caab1ff4504df64da91d1a43eea419479d82ed530fef26ffb58a'
            'd17dc020dae651ce0e4d79229780ec19f2accf43c383e8a4a7f5b1b58f58d8e9'
            '225d0a8e2be6f00158be07591373c5da1f486083f1163b8c89613b0f3548e0c0')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $srcdir/socks-relay-${pkgver}/socks-relay.py "${pkgdir}/usr/bin/socks-relay"
    install -Dm644 "socks-relay.service" -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm600 "socks-relay.conf" ${pkgdir}/etc/default/socks-relay
}
