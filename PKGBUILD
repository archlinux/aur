# Maintainer: ZorinArch <zorinarch@protonmail.com>
pkgname="penpot-desktop-bin"
pkgver=0.2.4
pkgrel=1
pkgdesc="Penpot Desktop delivers a desktop-like experience for Penpot users with the additional of integrating tabs to conveniently traverse back and forth between projects."
arch=('x86_64')
conflicts=("penpot-desktop")
depends=("c-ares" "ffmpeg" "gtk3" "http-parser" "libevent" "libvpx" "libxslt" "libxss" "minizip" "nss" "re2" "snappy" "libnotify" "libappindicator-gtk3")
url="https://sudovanilla.com/code/Korbs/Penpot-Desktop/"
license=('MIT')
_filename=Penpot-Desktop-${pkgver}.pacman
source=("$_filename::https://sudovanilla.com/distribute/applications/penpot-desktop/latest/Penpot-Desktop.pacman")
noextract=("${_filename}")
md5sums=('SKIP')

package() {
	tar -xJv -C "${pkgdir}" -f "${srcdir}/${_filename}" usr opt
	mkdir "$pkgdir/usr/bin"
	ln -s "/opt/Penpot Desktop" "$pkgdir/usr/bin/penpot-desktop"

	# SUID chrome-sandbox for Electron 5+
	chmod 4755 '/opt/Penpot Desktop/chrome-sandbox' || true
}



