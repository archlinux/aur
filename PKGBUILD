# Maintainer: ZhangHua<zhanghua.00 at qq dot com>

pkgname=aria2cd
pkgver=2.0.2
pkgrel=1
pkgdesc="A script and systemd serice to start aria2 automatically."
arch=("any")
url="https://aur.archlinux.org/packages/aria2cd"
license=(LicenseRef-WTFPL)
source=(aria2.service
        aria2@.service
        update-tracker
        LICENSE::http://www.wtfpl.net/txt/copying)
sha256sums=('75cfd503b582b4d57f8b03602ffd1d056451b6934439be44bd8fad4190e9df33'
            '37d1e760069b419ad9ebab6c5a3d538d31807e833047eefb9a129b0022b5bd2d'
            '5172b212283fc2111cb47160c2a6894baba4c63e8c4d4ebcf30fa97413c94239'
            '0356258391e190dc1d44ea01565cfe627fe44e27dad693a0a54c2483a7b223e5')
package() {
    depends=(aria2 systemd bash sed grep coreutils)
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/update-tracker" "${pkgdir}/usr/lib//aria2cd/update-tracker"
    install -Dm644 "${srcdir}/aria2.service" "${pkgdir}/usr/lib/systemd/user/aria2.service"
    install -Dm644 "${srcdir}/aria2@.service" "${pkgdir}/usr/lib/systemd/system/aria2@.service"
}
