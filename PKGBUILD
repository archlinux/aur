# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Co-Maintainer: Sneljo <jo.snel@hotmail.com>

pkgname="auryo-bin"
pkgver=2.1.2
pkgrel=2
pkgdesc="A SoundCloud client for your desktop."
arch=("x86_64")
license=("GPL-3.0")
url="http://auryo.com"
conflicts=('auryo' 'auryo-git')
source=("https://github.com/Superjo149/auryo/releases/download/v${pkgver}/auryo-${pkgver}.pacman")
sha256sums=("2568cc173b437810b0729a18efc3e9b1339a15fc572af44749f4aecb2430a1fa")

package() {
    cd "${srcdir}/"
    install -dm755 "${pkgdir}/opt/"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/opt/Auryo" "${pkgdir}/opt/"
    cp -r "${srcdir}/usr/share/applications/auryo.desktop" "${pkgdir}/usr/share/applications/"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/Auryo/auryo" "${pkgdir}/usr/bin/auryo"
}
