# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: ihipop <ihipop at gmail dot com>
_pkgname=warp-terminal
pkgname="${_pkgname}-bin"

pkgver=0.2025.05.07.08.12.stable.02
_pkgver=0.2025.05.07.08.12.stable_02
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
source_x86_64=("${_pkgname}-${pkgver}-_amd64.deb::https://releases.warp.dev/stable/v${_pkgver}/warp-terminal_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-_arm64.deb::https://releases.warp.dev/stable/v${_pkgver}/warp-terminal_${pkgver}_arm64.deb")







sha256sums=('1057b326e587edf2f81dc35c6c9cdd2e63d9af1c68e331d7ac8a4bc22ff9de49')
sha256sums_x86_64=('40cb267df4cf9b487ef2492d48dd96fd4de709e298b137348faa4bb2efeb55b0')
sha256sums_aarch64=('b9978e812f755a826c00cdeecd8bd9aa9ec12aa202c1a86ead1f47be53a1c708')

        package() {
	tar xf data.tar.xz -C "${pkgdir}"
	#install -d "${pkgdir}/opt/warpdotdev/${_pkgname}"
	cd $pkgdir
	install -d "$pkgdir/usr/bin/"
	install -d "$pkgdir/opt/$_pkgname"
  ln -s "/opt/warpdotdev/$_pkgname/warp" "$pkgdir/usr/bin/$_pkgname"

}
