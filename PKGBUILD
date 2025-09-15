# Maintainer: Eikano <lcuoin@gmail.com>

_pkgname="tsukimi"
pkgname="${_pkgname}-bin"
pkgver=0.21.0
pkgrel=2
pkgdesc='A simple third-party Jellyfin client for Linux'
arch=('x86_64')
url="https://github.com/tsukinaha/tsukimi"
license=('GPL-3.0-or-later')
provides=('tsukimi')
conflicts=('tsukimi-git')
depends=(
	'mpv'
	'ffmpeg'
	'libadwaita'
	'gstreamer'
	'gtk4')
makedepends=(
	'git'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsukinaha/tsukimi/releases/download/v${pkgver}/tsukimi-x86_64-linux.tar.gz"
	"tsukimi.desktop"
	"tsukimi.png")
sha256sums=('a10fc7159d2ff838df9fcd2f398027edc01b4bbe390d2ab3f9023c32382396c1'
	'd12dc777bbb05ed92d75f8d36e453b651e12596ead6e297386419a24d051a0a3'
	'04a712d60bbf5cc8873af24fb8ff76b47f27ef77ba45c7901fb7d3cd26dd6893')

package() {
	install -Dm0755 -t "${pkgdir}/usr/bin/" "tsukimi"
	install -Dm 644 -t "${pkgdir}/usr/share/glib-2.0/schemas" "moe.tsuna.tsukimi.gschema.xml"
	install -Dm 644 -t "${pkgdir}/usr/share/applications/" "${srcdir}/tsukimi.desktop"
	install -Dm 644 -t "${pkgdir}/usr/share/pixmaps/" "${srcdir}/tsukimi.png"
	cp -r "i18n/locale" "${pkgdir}/usr/share/locale"
}
