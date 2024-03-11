# Maintainer: ferstar
pkgname=wechat-linux-bwrap
pkgver=2.2.0
pkgrel=1
epoch=
pkgdesc="Tencent WeChat Client from Spark Store with sandboxing using bwrap"
arch=('x86_64')
url=""
license=('proprietary')
groups=()
depends=('snapd-xdg-open-git' 'nss' 'lsb-release' 'xdg-utils' 'libxss' 'bc' 'libnotify' 'bubblewrap' 'xdg-desktop-portal-gtk')
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
	wechat-linux.desktop
	wechat-linux.svg
	wechat-${pkgver}.deb::"https://cdn4.cnxclm.com/uploads/2024/03/08/85uZHDjz_store.spark-app.wechat-linux-spark_2.2-real1.0.0.0_amd64.deb?attname=store.spark-app.wechat-linux-spark_2.2-real1.0.0.0_amd64.deb"
)
noextract=()
md5sums=('1c0c66925be80da7ba1cac7619d8ae4c'
         '4416ba2723325292f2177eec63775f62'
         '600e74549ce2258c045d5c2f7689ea63'
         'caabaa599446f5a23364644f734e2e2c')
validpgpkeys=()
function package() {
	tar -xf data.tar.xz ./opt/apps
	mkdir -p "${pkgdir}"/opt
	cp opt/apps "${pkgdir}"/opt/apps -r
	install -Dm644 wechat-linux.desktop "${pkgdir}/usr/share/applications/wechat-linux.desktop"
	install -Dm755 wechat.sh "${pkgdir}/usr/bin/wechat-linux"
	install -Dm644 wechat-linux.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-linux.svg"
}
install=wechat-linux.install
