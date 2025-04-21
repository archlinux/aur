# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: ihipop <ihipop at gmail dot com>
_pkgname=warp-terminal
pkgname="${_pkgname}-bin"
pkgver=0.2025.04.16.08.11.stable.02
_pkgver=0.2025.04.16.08.11.stable_02
pkgrel=1
pkgdesc="Warp is the intelligent terminal with AI and your dev team's knowledge built-in."
arch=('x86_64' 'aarch64')
url="https://warp.dev"
license=('custom:WARP')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')
depends=()
source=("LICENSE.txt")
source_x86_64=("${_pkgname}-{$pkgver}-_amd64.deb::https://releases.warp.dev/stable/v${_pkgver}/warp-terminal_v${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-_arm64.deb::https://releases.warp.dev/stable/v${_pkgver}/warp-terminal_v${pkgver}_arm64.deb")







sha256sums=('1057b326e587edf2f81dc35c6c9cdd2e63d9af1c68e331d7ac8a4bc22ff9de49')
sha256sums_x86_64=('d3610e2616dcc5bb0d125f01beba2ed74963b074347a5ca6a1f1524bdbc39c73')
sha256sums_aarch64=('655dd7ff95f32948857ae8378614a5b3022c03fec91ef260a0b392bd39e1d291')

        package() {
	tar xf data.tar.xz -C "${pkgdir}"
	#install -d "${pkgdir}/opt/warpdotdev/${_pkgname}"
	cd $pkgdir
	install -d "$pkgdir/usr/bin/"
	install -d "$pkgdir/opt/$_pkgname"
  ln -s "/opt/warpdotdev/$_pkgname/warp" "$pkgdir/usr/bin/$_pkgname"

}
