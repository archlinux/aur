# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Co-Maintainer: Sneljo <jonas.snellinckx@gmail.com

pkgname="auryo-bin"
pkgver=2.5.4
pkgrel=2
pkgdesc="A SoundCloud client for your desktop."
arch=("x86_64")
license=("GPL-3.0")
url="https://auryo.com"
conflicts=('auryo' 'auryo-git')
source=("https://github.com/Superjo149/auryo/releases/download/v${pkgver}/auryo-${pkgver}.pacman")
sha256sums=("928279fc176c509044a7e172d06c15ae9dada0a92c4393e863ef2c95e60f82a3")

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
