# Maintainer: VConet <v-conet@outlook.com>

pkgname=bank-ccb
_pkgname=com.ccbsecurityextension
pkgver=1.0.0.0
pkgrel=1
pkgdesc="中国建设银行、中国银行可用控件"
arch=('x86_64' 'aarch64' 'loongarch64' 'mips64')
url="https://ebank.ccb.com/cn/html1/grwyaqkjzy/grwyaqkjzy.html"
license=('custom')
depends=('glibc')
source=('https://image4.ccb.com/cn/html1/office/ebank/dzb/subject/12/docs/security/CCBSecurityExtension.deb')
options=(!strip)
sha256sums=('194e746a3673cc59b55fba055e63a1a525ded6069b16972a698370190009a2bd')
optdepends=('browser360-bin: 支持的浏览器')


package() {
    tar xpf data.tar.xz -C "$pkgdir"

    rm -r "$pkgdir/etc/"
    rm -r "$pkgdir/usr/lib/cups"

    mkdir -p "$pkgdir/usr/lib/mozilla/plugins/"
    install -Dm755 "$pkgdir/opt/apps/$_pkgname/files/arch/$CARCH/libnpCCBMacCtrlSingle.so" "$pkgdir/usr/lib/mozilla/plugins/libnpCCBMacCtrlSingle.so"
}
