# Maintainer: Michael Engelhard <engelhard.michael+git@gmail.com>
pkgname=neolight
pkgver=1.0
pkgrel=1
pkgdesc='Additional layers for the german qwertz keyboard layout and others.'
arch=('any')
url='https://github.com/mihi314/neolight'
license=('GPL')
depends=('xkeyboard-config' 'bash')

_tag="v${pkgver}"
_repo_url='https://raw.githubusercontent.com/mihi314/neolight'
install='neolight.install'
source=("${_repo_url}/${_tag}/linux/neolight"
        "${_repo_url}/${_tag}/linux/register-neolight.sh"
        "register-neolight.hook")
md5sums=('7c8ff562fc2aa3083504153858471e5d'
         '433d01c216b121d6917ea8df08391035'
         'ea5d2bf7d983a2629fc02de193557f0b')

package() {
    install -Dm 644 "${srcdir}/neolight" "${pkgdir}/usr/share/X11/xkb/symbols/neolight"
    install -Dm 755 "${srcdir}/register-neolight.sh" "${pkgdir}/usr/share/libalpm/scripts/register-neolight.sh"
    install -Dm 644 "${srcdir}/register-neolight.hook" "${pkgdir}/usr/share/libalpm/hooks/register-neolight.hook"
}
