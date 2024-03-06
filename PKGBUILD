# Maintainer: Kimiblock Moe
pkgname=wechat-uos-bwrap
pkgver=1
pkgrel=3
epoch=
pkgdesc="WeChat Testing with bwrap sandbox"
arch=('x86_64')
url=""
license=('proprietary')
groups=()
depends=('snapd-xdg-open-git' 'nss' 'lsb-release' 'xdg-utils' 'libxss' "wechat-uos" 'bc' 'libnotify' 'bubblewrap' 'xdg-desktop-portal-gtk')
makedepends=()
checkdepends=()
optdepends=(
	'xdg-desktop-portal-kde: KDE Portal'
	'xdg-desktop-portal-lxqt: lxqt Portal'
	'xdg-desktop-portal-gnome: Gnome Portal'
)
provides=()
conflicts=()
replaces=()
source=(
	wechat.sh
	wechat-uos-beta.desktop
	wechat-uos-beta.svg
	wechat-${pkgver}.deb::"https://cdn4.cnxclm.com/uploads/2024/03/05/3VDyAc0x_wechat-beta_1.0.0.145_amd64.deb?attname=wechat-beta_1.0.0.145_amd64.deb"
)
noextract=()
md5sums=('4f045cfc1c9c5804d5cea1c2bde85c45'
         '0b654857592a9713c65a58bd061811ba'
         '600e74549ce2258c045d5c2f7689ea63'
         '1da072bd774d1b5c08b9545b409e3fcb')
validpgpkeys=()
function package() {
	tar -xf data.tar.xz ./opt/wechat-beta
	mkdir -p "${pkgdir}"/opt
	cp opt/wechat-beta "${pkgdir}"/opt/wechat-beta -r
	install -Dm644 wechat-uos-beta.desktop "${pkgdir}/usr/share/applications/wechat-uos-beta.desktop"
	install -Dm755 wechat.sh "${pkgdir}/usr/bin/wechat-uos-beta"
	install -Dm644 wechat-uos-beta.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-uos-beta.svg"
}
