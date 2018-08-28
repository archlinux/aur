# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Co-Maintainer: Sneljo <jo.snel@hotmail.com>

pkgname="auryo-bin"
pkgver=2.1.1
pkgrel=1
pkgdesc="A SoundCloud client for your desktop."
arch=("x86_64")
license=("GPL-3.0")
url="http://auryo.com"
conflicts=('auryo' 'auryo-git')
source=("https://github.com/Superjo149/auryo/releases/download/v${pkgver}/auryo-${pkgver}.pacman")
sha256sums=("14c0d22d2ea1112099e245e0d86b1169107f3b9a5a067e7d83d3e9958d1978e3")

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
