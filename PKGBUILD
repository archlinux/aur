# Maintainer: Borhan <me@bor691.ir>
pkgname=shadowsocksr-native-bin
pkgver=0.9.4
pkgrel=2
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
sha256sums=('509523ccbdedeb5fdfd8c4e5d048bed2fd21aeafb4e24360d60ad68cc8dc9f41'
            '6f2192373b491adfe28e9bfc6abccd2f7f3d3f35a7bf56c7caa0b3b18131f286'
            '59006db793e26c51617d3009a5959381f563d666d518675c344cff215ab0002b')

package() {
    install -D -m755 "${srcdir}/ssr-client" "${pkgdir}/usr/bin/ssr-client"
    install -D -m755 "${srcdir}/ssr-server" "${pkgdir}/usr/bin/ssr-server"
    install -D -m644 "${srcdir}/config.json" "${pkgdir}/etc/ssr-native/config.json"

    install -D -m644 "${srcdir}/shadowsocksr-native@.service" \
        "${pkgdir}/usr/lib/systemd/system/shadowsocksr-native@.service"
    install -D -m644 "${srcdir}/shadowsocksr-native-server@.service" \
        "${pkgdir}/usr/lib/systemd/system/shadowsocksr-native-server@.service"
}

