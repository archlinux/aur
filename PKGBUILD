# Inspired by https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=xkb-qwerty-fr
# Maintainer: Joël Porquet-Lupine <joel@porquet.org>

_pkgname=altgr-weur
pkgname=xkb-altgr-weur
pkgver=2
pkgrel=2
pkgdesc="Keyboard layout based on letter frequencies for 11 Western European
languages (English, Danish, Dutch, Finnish, French, German, Italian, Norwegian,
Portugese, Spanish and Swedish)"
arch=('any')
url="https://altgr-weur.eu/"
license=('custom')
depends=('xkeyboard-config' 'perl')
install=${pkgname}.install
source=("https://altgr-weur.eu/${_pkgname}"
        "${pkgname}.hook"
        "${pkgname}"
        )
md5sums=('3d042fc8ffd894ebd698523b08fd93bf'
        '68322ffd940f7bec47dae3e4e392eb68'
        '9937e3aee76c716c9fab6bcd6fe8bbf5')

package() {
    cd "${srcdir}"
    install -D -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -D -m 644 ${pkgname}.hook ${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook
    install -D -m 644 ${_pkgname} ${pkgdir}/usr/share/xkeyboard-config-2/symbols/${_pkgname}
}
