# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4-bin
_pkgname=gtkcord4
pkgver=0.0.6
pkgrel=1
pkgdesc='Discord client written in go and gtk4, binary release'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL3')
provides=('gtkcord4')
conflicts=('gtkcord4' 'gtkcord4-git')
depends=('gtk4' 'gobject-introspection')

source_x86_64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-x86_64.tar.gz"
               "${_pkgname}.desktop::https://raw.githubusercontent.com/diamondburned/gtkcord4/v${pkgver}/.nix/com.github.diamondburned.gtkcord4.desktop")
source_aarch64=("https://github.com/diamondburned/gtkcord4/releases/download/v${pkgver}/gtkcord4-linux-aarch64.tar.gz"
               "${_pkgname}.desktop::https://raw.githubusercontent.com/diamondburned/gtkcord4/v${pkgver}/.nix/com.github.diamondburned.gtkcord4.desktop")
sha256sums_x86_64=('dd1811c84d15883f9741bf01d2936a7c2fcd176b7237e75d9c87919ef76aa822'
                   '8a2bffbe6e33af6f0b79366fb153114f2de3e16b538cc303d40ddd1841d7d1df')
sha256sums_aarch64=('763372815fa17e012c12cfc61deee25fc0b0a081fac18aa9a737cfd3c06742f7'
                    '8a2bffbe6e33af6f0b79366fb153114f2de3e16b538cc303d40ddd1841d7d1df')


package() {
    install -Dm755 gtkcord4 "${pkgdir}"/usr/bin/gtkcord4
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i "s/Chat;/Chat;InstantMessaging;/" "${srcdir}/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
