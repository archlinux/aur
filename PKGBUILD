# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
pkgname=n-ninja
pkgver=2.0
pkgrel=3
pkgdesc="Metanet's unique 2D puzzle/action platform game"
arch=('i686' 'x86_64')
url="http://www.metanetsoftware.com/"
license=('custom')
install="${pkgname}.install"
depends=('flashplugin')
[ "$CARCH" == 'x86_64' ] && depends+=('lib32-flashplugin')
source=("${pkgname}-${pkgver}.tar::http://www.thewayoftheninja.org/Nv2-Linux.tar"
        "${pkgname}.sh"
        "${install}")
sha256sums=('3a6c0cb980a99a792eed6247e7afd27c235d62df759955107fca3043836c62d4'
            '0f02b3f3302ea91668a67a6cd2f5a0e0b0c6615f266cc23550390b4f6df6f9c1'
            'da77d0239f3a4f10930fa200c3e2846bd461690edee0539081a0b8cc54b6e219')

package() {
   install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 Nv2-Linux.swf "${pkgdir}/usr/share/${pkgname}/${pkgname}.swf"
   install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

