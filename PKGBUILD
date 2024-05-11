# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=kingsoft-xiezuo
pkgver=4.22.0
pkgrel=1
pkgdesc="WPS 协作 聊天 / 会议 / 邮箱融合一体"
arch=(x86_64 aarch64)
url="https://365.wps.cn/download365"
license=('custom')
# by namcap, some may be optdepends
depends=(electron22
	qt5-svg
	libxkbcommon-x11
	libxv
	sdl2
	alsa-lib
	libxss
	libice
	libpulse
	libvdpau
	nodejs
	libsm
	libbsd
	libde265
	ffmpeg
	qt5-base
	python
	fontconfig
	freetype2
	libxext
	glibc
	libxcursor
	libxrender
	libglvnd
	libxinerama
	libxkbcommon
	bash
	libxi
	zlib
	libxrandr
	libx11
	libdrm
	wayland
	hicolor-icon-theme
	libxcb
	libxxf86vm
	libxfixes
	gcc-libs
)
makedepends=(asar)
provides=()
source=("local://signed_04251952_xiezuo_4.22.0_amd64_rc_4.22.0_branch_f74c2566a8_stable.deb"
)
sha256sums=('8a4267db9c09ad248bf8953ceb5c471929ab15f727680a9eec4be28706e424c0')
options=(!strip)

package() {
	printf "extract\n"
	tar -xf data.tar.* -C $pkgdir

	#	printf "asar e app.asar app\n"
	#	pushd $pkgdir/opt/xiezuo/resources/
	#	asar e app.asar app &>/dev/null || true
	#	rm app.asar
	#	popd
	#	printf "rm electron\n"
	#	find $pkgdir/opt -not -path "*/resources/*" -type f -delete
	#
	#	printf "launch script\n"
	#	printf "#!/bin/sh
	#exec electron22 /opt/xiezuo/resources/app \"\$@\"
	#" | install -Dm755 /dev/stdin $pkgdir/opt/xiezuo/xiezuo

	# printf "fix error\n"
	# find $pkgdir \( -name "config" -and -path "*app/config" \) -type d -exec cp -av {} $pkgdir/opt/xiezuo/ \;
	# find $pkgdir -name "package.json" -type f -path "*/resources/app/*" -exec install -Dm644 {} $pkgdir/opt/xiezuo/ \;

	#	find $pkgdir \( -name "*.c" -or -name "*.js.map" -or -name "*.hpp" -or -name "*.cpp" -or -name "*.py" -or -path "*darwin*" \) -type f -delete

	#	find $pkgdir -type d -empty -delete
}
