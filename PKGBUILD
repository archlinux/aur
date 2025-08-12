# Maintainer: Jonas Kalsvik <jonas@kalsvik.no>
pkgname="epicmickeylauncher"
pkgver="0.5.4"
pkgrel=13
epoch=
pkgdesc="Mod Installer, Level Loader & Launcher for every Epic Mickey game."
arch=('x86_64')
url="https://eml.kalsvik.no"
license=('MIT')
groups=()
depends=(
	"webkit2gtk-4.1"
	"base-devel"
	"curl"
	"wget"
	"file"
	"openssl"
	"appmenu-gtk-module"
	"libappindicator-gtk3"
	"librsvg"
	)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Epic-Mickey-Launcher/launcher/releases/download/${pkgver}/Epic.Mickey.Launcher_${pkgver}_amd64.deb")
noextract=()
validpgpkeys=()


prepare(){
 tar -zxvf data.tar.gz
}

package() {
	cd ${srcdir}
	install -Dm755 "usr/bin/epic-mickey-launcher" "${pkgdir}/usr/bin/epic-mickey-launcher"
	install -Dm755 "usr/share/applications/epic-mickey-launcher.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	cp -r "${srcdir}/usr/share/icons/" "${pkgdir}/usr/share/icons/"
}

md5sums=('ba96e34daa42bfb714ce20f5fb1054bc')
