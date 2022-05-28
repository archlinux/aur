# Maintainer: Michael Engelhard <engelhard.michael+git@gmail.com>
pkgname=neolight
pkgver=1.2.0
pkgrel=1
pkgdesc='Additional layers for the german qwertz keyboard layout and others.'
arch=('any')
url='https://github.com/mihi314/neolight'
license=('GPL')
depends=('xkeyboard-config')
optdepends=('ibus: adds neolight to the ibus input methods')

_tag="v${pkgver}"
_repo_url='https://raw.githubusercontent.com/mihi314/neolight'

install='neolight.install'
source=("${_repo_url}/${_tag}/linux/neolight"
        "${_repo_url}/${_tag}/linux/register-neolight.sh"
        "register-neolight.hook")
md5sums=('64c22a708abbd99c45ccf5f224d522d6'
         '450e3c6aa9c0fe9b2f9048bde5ce438a'
         'c6e81d0589bab55863b25cbffbaebf09')

package() {
    install -Dm 644 "${srcdir}/neolight" "${pkgdir}/usr/share/X11/xkb/symbols/neolight"
    install -Dm 755 "${srcdir}/register-neolight.sh" "${pkgdir}/usr/share/libalpm/scripts/register-neolight.sh"
    install -Dm 644 "${srcdir}/register-neolight.hook" "${pkgdir}/usr/share/libalpm/hooks/register-neolight.hook"
}
