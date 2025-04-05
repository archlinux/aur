# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: ihipop <ihipop at gmail dot com>
_pkgname=warp-terminal
pkgname="${_pkgname}-bin"
pkgver=0.2025.04.02.08.11.stable.03
_pkgver=0.2025.04.02.08.11.stable_03
pkgrel=1
pkgdesc="Warp is the intelligent terminal with AI and your dev team's knowledge built-in."
arch=('x86_64' 'aarch64')
url="https://warp.dev"
license=('custom:WARP')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')
depends=()
source=(
    "${_pkgname}-_amd64.deb::https://releases.warp.dev/stable/v${_pkgver}/warp-terminal_${pkgver}_amd64.deb"
    "${_pkgname}-_arm64.deb::https://releases.warp.dev/stable/v${_pkgver}/warp-terminal_${pkgver}_arm64.deb"
    "LICENSE.txt"
)
sha256sums=('d3610e2616dcc5bb0d125f01beba2ed74963b074347a5ca6a1f1524bdbc39c73'
            '655dd7ff95f32948857ae8378614a5b3022c03fec91ef260a0b392bd39e1d291'
            '341bc0f8670640fab789d19f4e6e8e9da0fc282531fddae976c52f431798641d')

        package() {
	tar xf data.tar.xz -C "${pkgdir}"
	#install -d "${pkgdir}/opt/warpdotdev/${_pkgname}"
	cd $pkgdir
	install -d "$pkgdir/usr/bin/"
	install -d "$pkgdir/opt/$_pkgname"
  ln -s "/opt/warpdotdev/$_pkgname/warp" "$pkgdir/usr/bin/$_pkgname"

}
