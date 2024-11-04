# Maintainer: Eikano <lcuoin@gmail.com>

_pkgname="tsukimi"
pkgname="${_pkgname}-bin"
pkgver=0.16.9
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsukinaha/tsukimi/releases/download/v${pkgver}/tsukimi-x86_64-linux.tar.gz"
	"tsukimi.desktop"
	"tsukimi.png")
sha256sums=('98969de5ea63bdacf8bd352de85b7eb24d196344f2e35f8662f0ec4886eb31da'
	'd12dc777bbb05ed92d75f8d36e453b651e12596ead6e297386419a24d051a0a3'
	'04a712d60bbf5cc8873af24fb8ff76b47f27ef77ba45c7901fb7d3cd26dd6893')

package() {
	install -Dm0755 -t "${pkgdir}/usr/bin/" "tsukimi"
	install -Dm 644 -t "${pkgdir}/usr/share/glib-2.0/schemas" "moe.tsuna.tsukimi.gschema.xml"
	install -Dm 644 -t "${pkgdir}/usr/share/applications/" "${srcdir}/tsukimi.desktop"
	install -Dm 644 -t "${pkgdir}/usr/share/pixmaps/" "${srcdir}/tsukimi.png"
	cp -r "i18n/locale" "${pkgdir}/usr/share/locale"
}
