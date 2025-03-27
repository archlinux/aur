# Maintainer: TheCyberArcher@protonmail.ch
# Contributor: Emilio Reggi <nag@mailbox.org>

pkgname=ymuse-bin
_pkgname=ymuse
pkgver=0.22
pkgrel=2
pkgdesc="Easy, functional, and snappy client for Music Player Daemon (MPD)."
arch=('x86_64')
url="https://yktoo.com/en/software/ymuse/#software-downloads"
license=('Apache-2.0')
depends=('gtk3')
optdepends=('mpd')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/yktoo/ymuse/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")
noextract=("${_pkgname}_${pkgver}_linux_amd64.deb")
sha256sums=(
	"6af951b36ed1bb263d264cda339a74523ee4e65e69f97155b11bfdf88f6afbf5")

package() {
   bsdtar -O -xf "${_pkgname}_${pkgver}_linux_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
}
