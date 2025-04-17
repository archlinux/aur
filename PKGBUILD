# Maintainer: ZhangHua<zhanghua.00 at qq dot com>

pkgname=aria2cd
pkgver=2.0.1
pkgrel=1
pkgdesc="A script and systemd serice to start aria2 automatically."
arch=("any")
url="https://aur.archlinux.org/packages/aria2cd"
license=(LicenseRef-WTFPL)
source=(aria2.service
        aria2@.service
        update-tracker
        LICENSE::http://www.wtfpl.net/txt/copying)
sha256sums=('507c144047d2fdd983b621feb0d2ab3b399ff99a4b2881244b49563f667028eb'
            '70dec90a4b2f038992117e7314e99e2ddbc2e22a0ec3ef9fd05fce8aaad4fee8'
            '5172b212283fc2111cb47160c2a6894baba4c63e8c4d4ebcf30fa97413c94239'
            '0356258391e190dc1d44ea01565cfe627fe44e27dad693a0a54c2483a7b223e5')
package() {
    depends=(aria2 systemd bash sed grep coreutils)
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/update-tracker" "${pkgdir}/usr/lib//aria2cd/update-tracker"
    install -Dm644 "${srcdir}/aria2.service" "${pkgdir}/usr/lib/systemd/user/aria2.service"
    install -Dm644 "${srcdir}/aria2@.service" "${pkgdir}/usr/lib/systemd/system/aria2@.service"
}
