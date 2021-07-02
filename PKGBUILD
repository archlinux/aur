# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=ymuse-bin
_pkgname=ymuse
pkgver=0.17
pkgrel=1
pkgdesc="Easy, functional, and snappy client for Music Player Daemon (MPD)."
arch=('x86_64')
url="https://yktoo.com/en/software/ymuse/#software-downloads"
license=('Apache')
depends=('gtk3')
optdepends=('mpd')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/yktoo/ymuse/releases/download/v0.17/${_pkgname}_${pkgver}_linux_amd64.deb")
noextract=("${_pkgname}_${pkgver}_linux_amd64.deb")
sha256sums=(
	"3881178b59c2c96fdf6ff55fd863310c58b94ed85156dd24c733e004abba37c8")

package() {
   bsdtar -O -xf "${_pkgname}_${pkgver}_linux_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
}
