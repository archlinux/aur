# Maintainer: VConet <v-conet@outlook.com>

pkgname=bank-icbc
_pkgname=cfca-seceditctladv-icbc
pkgver=3.3.0.2
pkgrel=1
pkgdesc="中国工商银行控件"
arch=('x86_64')
url="https://www.icbc.com.cn/"
license=('custom')
depends=()
source=('https://epass.icbc.com.cn/signed_uos_product_SecEditCtlAdv.ICBC.x86_64.deb')
options=(!strip)
sha256sums=('bc7740b1d054e3d7b4e14064be7a5e806b684e96bd7580a9568a7ec62932a9c5')
optdepends=('browser360-bin: 支持的浏览器')


package() {
    tar xpf data.tar.xz -C "$pkgdir"

    rm -r "$pkgdir/opt/cfca/ICBC/SecEditCtlAdv/Uninstall.sh"

    install -Dm755 "$pkgdir/opt/cfca/ICBC/SecEditCtlAdv/libnpSecEditCtlAdv-ICBC-plugin.so.$pkgver" "$pkgdir/usr/lib/mozilla/plugins/libnpSecEditCtlAdv-ICBC-plugin.so"
    install -Dm755 "$pkgdir/opt/cfca/ICBC/SecEditCtlAdv/libnpMsgEncCtlAdv-ICBC-plugin.so.$pkgver" "$pkgdir/usr/lib/mozilla/plugins/libnpMsgEncCtlAdv-ICBC-plugin.so"
}
