# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=ymuse-bin
_pkgname=ymuse
pkgver=0.21
pkgrel=2
pkgdesc="Easy, functional, and snappy client for Music Player Daemon (MPD)."
arch=('x86_64')
url="https://yktoo.com/en/software/ymuse/#software-downloads"
license=('Apache')
depends=('gtk3')
optdepends=('mpd')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/yktoo/ymuse/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")
noextract=("${_pkgname}_${pkgver}_linux_amd64.deb")
sha256sums=(
	"8c9a1903dc33de2ef8daeb37d8854f6d807f0175f01beffa99f8cb76f5118f3c")

package() {
   bsdtar -O -xf "${_pkgname}_${pkgver}_linux_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
}
