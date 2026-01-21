# Maintainer: coolcoala
# Submitter: prettyleaf

pkgname=koala-clash-bin
_pkgname=koala-clash
_gitpkgname=Koala.Clash
pkgver=0.2.9
pkgrel=4
pkgdesc="Fork of Clash Verge Rev | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/coolcoala/koala-clash"
license=('GPL3')
depends=('webkit2gtk-4.1' 'webkitgtk-6.0' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-verge-rev" "clash-verge-rev-bin" "clash-verge-rev-autobuild" "clash-verge-rev-autobuild-bin")
options=('!strip')
install=${pkgname}.install

source_x86_64=("${_pkgname}-${pkgver}-${CARCH}.deb::${url}/releases/download/v${pkgver}/${_gitpkgname}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-${CARCH}.deb::${url}/releases/download/v${pkgver}/${_gitpkgname}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-${CARCH}.deb::${url}/releases/download/v${pkgver}/${_gitpkgname}_armhf.deb")

sha256sums_x86_64=('0729a9cd1a28375d99f1aa82863ff1e4a0c479e0d79c569f41b2429107215fea')
sha256sums_aarch64=('da2564efdb0646ae1bffe5b13359e52cfcc70205b5911400f3780e98fd6900bb')
sha256sums_armv7h=('b4b6ff9a070324bbfad139f9ae24cfe9d20b4119e3849137ca9f2f1ceb490d98')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
