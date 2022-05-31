# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=ymuse-bin
_pkgname=ymuse
pkgver=0.20
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
	"218adc4fe6829e1ee2b5a7199fe1689a2acbabc3de417364c7b9b3a8ec62fcc0")

package() {
   bsdtar -O -xf "${_pkgname}_${pkgver}_linux_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
}
