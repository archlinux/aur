# Maintainer: VConet <v-conet@outlook.com>
pkgname=bank-abc
_pkgname=com.websocket.tdr.abc
pkgver=1.0.7
pkgrel=1
pkgdesc="中国农业银行控件"
arch=('x86_64')
url="https://perbank.abchina.com/EbankSite/ebank/frequentlyQuestions"
license=('custom')
depends=('nss')
source=(
    'install_ca.sh'
    'OnWebSocketTray_ABC.desktop'
)
sha256sums=(
    'e9b5ac75b7806d85f6b268220207797a2b529879ff592ac453e30e7097780877'
    'ca75c0747601064326553a688b2e8c4f54f4cc7bd631747bf2f0b6bb079fdd12'
)
options=(!strip)
install=.install
optdepends=('browser360-bin: 支持的浏览器')
source_x86_64=('https://ebhelper.cdn-static.abchina.com.cn/ebhelper/DriverData/signed_abc_tdr_websocket_usbkey_uos_x86.deb')
source_aarch64=('https://ebhelper.cdn-static.abchina.com.cn/ebhelper/DriverData/signed_abc_tdr_websocket_usbkey_uos_arm.deb')
source_loongarch64=('https://ebhelper.cdn-static.abchina.com.cn/ebhelper/DriverData/signed_abc_tdr_websocket_usbkey_uos_loongarch.deb')

sha256sums_x86_64=('b68c6784750b7c9256de51ae1aa7de0a4f62f035301d3e1f04c94c2cbc2403b1')
sha256sums_aarch64=('02863dca6209e455ce9b6f88d034f102ee46e2d89ab28c5d849e5d4137144e27')
sha256sums_loongarch64=('b828224053a81d4261ee0a794eec7dae93690bcb72cb42a06cf206f6ac0048f5')

package() {
    tar xpf data.tar.xz -C "$srcdir"

    install -Dm755 "$srcdir/install_ca.sh" "$pkgdir/opt/apps/$_pkgname/files/bin/install_ca.sh"
    install -Dm755 "$srcdir/opt/apps/$_pkgname/files/OnWebABC.service" "$pkgdir/usr/lib/systemd/system/OnWebABC.service"

    install -Dm644 "$srcdir"/opt/apps/$_pkgname/files/bin/{com.websocket.tdr.abc.png,rsarootpem.cer} "$pkgdir/opt/apps/$_pkgname/files/bin/"

    install -Dm755 "$srcdir"/opt/apps/$_pkgname/files/bin/{libabcsTDRNToBank.so,libnng_ABC.so,openWebserver.sh,openWebserverABCTray.sh,webserver_ABC,webserver_ABC_Tray} "$pkgdir/opt/apps/$_pkgname/files/bin/"
    install -Dm755 "$srcdir/OnWebSocketTray_ABC.desktop" "$pkgdir/usr/share/applications/OnWebSocketTray_ABC.desktop"
}
