# Maintainer: Borhan <me@bor691.ir>
pkgname=shadowsocksr-native-bin
pkgver=0.9.4
pkgrel=1
epoch=
pkgdesc="ShadowsocksR-native is a lightweight secured SOCKS5 proxy with obsfucation."
arch=('x86_64')
url="https://github.com/ShadowsocksR-Live/shadowsocksr-native"
license=('GPL')
provides=('shadowsocksr-native' 'shadowsocksr')
backup=('etc/ssr-native/config.json')
source=("${url}/releases/download/${pkgver}/ssr-native-linux-x64.zip"
        "shadowsocksr-native@.service"
        "shadowsocksr-native-server@.service")
sha256sums=("509523ccbdedeb5fdfd8c4e5d048bed2fd21aeafb4e24360d60ad68cc8dc9f41"
            "b776d4590f5e0743530deb405296ced277282668a61348814b59db9f12721891"
            "f0496db45b5bd9cdf4b0d52016edbe49f8e57fd964c065c70cea564dcbf03b49")

package() {
    install -D -m755 "${srcdir}/ssr-client" "${pkgdir}/usr/bin/ssr-client"
    install -D -m755 "${srcdir}/ssr-server" "${pkgdir}/usr/bin/ssr-server"
    install -D -m644 "${srcdir}/config.json" "${pkgdir}/etc/ssr-native/config.json"

    install -D -m644 "${srcdir}/shadowsocksr-native@.service" \
        "${pkgdir}/usr/lib/systemd/system/shadowsocksr-native@.service"
    install -D -m644 "${srcdir}/shadowsocksr-native-server@.service" \
        "${pkgdir}/usr/lib/systemd/system/shadowsocksr-native-server@.service"
}

