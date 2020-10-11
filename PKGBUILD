# Maintainer: robertfoster

pkgname=your-freedom-network
_pkgname=${pkgname%-network}
pkgver=20200925
_subver=01
pkgrel=1
pkgdesc="A service to bypass Firewalls, Proxies and content Filters and stay anonymous while surfing, playing and downloading"
arch=('any')
url="https://www.your-freedom.net/"
license=('LGPL2.1' 'custom:ACCEPTABLE USE POLICY')
depends=('java-runtime' 'bash')
optdepends=('openvpn: VPN mode support'
    'dante: socksification support'
'tsocks: socksification support')
source=("https://www.your-freedom.net/ems-dist/freedom-$pkgver-$_subver.zip"
    "${_pkgname}.png"
    "${_pkgname}.sh"
    "${_pkgname}.desktop"
'ACCEPTABLE_USE_POLICY')

package() {
    cd "$srcdir"
    install -D -m755 "${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
    install -D "${_pkgname}.png" "$pkgdir/usr/share/pixmaps/your-freedom.png"
    install -D "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    install -D "freedom.jar" "$pkgdir/usr/share/java/${_pkgname}/freedom.jar"
    install -D "ACCEPTABLE_USE_POLICY" "$pkgdir/usr/share/licenses/${_pkgname}/ACCEPTABLE USE POLICY"
}

md5sums=('5acc963c3ed78e1b3e8fa9ea30dafee1'
         '9ab24f759c04f123e5367395fa0f43d8'
         'fe4ab41f26652258ea5fa4c309869972'
         'b8017cf56973d10dba097e83917f0f78'
         'e71ac5216e24c68db28abc1d92fba5d5')
