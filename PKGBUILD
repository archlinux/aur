# Maintainer: Eikano <lcuoin@gmail.com>

_pkgname="tsukimi"
pkgname="${_pkgname}-bin"
pkgver=0.4.10
pkgrel=1
pkgdesc='A simple third-party Emby client'
arch=('x86_64')
url="https://github.com/tsukinaha/tsukimi"
license=('GPL-3.0-or-later')
provides=('tsukimi')
conflicts=('tsukimi-git')
depends=(
	'ffmpeg'
	'libadwaita'
	'gstreamer'
	'gtk4')
makedepends=(
	'git'
	'cargo')
source=("https://github.com/tsukinaha/tsukimi/releases/download/v${pkgver}/tsukimi-x86_64-linux-gnu.tar.gz"
	"moe.tsuna.tsukimi.gschema.xml::https://raw.githubusercontent.com/tsukinaha/tsukimi/main/moe.tsuna.tsukimi.gschema.xml"
	"tsukimi.desktop"
	"tsukimi.png")
sha256sums=('eeb056c7b22b8400cb9d30dde7bb380336eed3182df69c852f15c1a4c493f081'
	'510c9ec7630948a56abad5fb9b9ae6a1296fae5cec1232b46d7d4159ed436a7c'
	'c4ddf8dbf68f04ecefd4280b48ef4084ae7d4d9ce1072f97e30832a565d13bf6'
	'04a712d60bbf5cc8873af24fb8ff76b47f27ef77ba45c7901fb7d3cd26dd6893')

package() {
	install -Dm0755 -t "${pkgdir}/usr/bin/" "tsukimi"
	install -Dm 644 -t "${pkgdir}/usr/share/glib-2.0/schemas" "moe.tsuna.tsukimi.gschema.xml"
	install -Dm 644 -t "${pkgdir}/usr/share/applications/" "${srcdir}/tsukimi.desktop"
	install -Dm 644 -t "${pkgdir}/usr/share/pixmaps/" "${srcdir}/tsukimi.png"
}
