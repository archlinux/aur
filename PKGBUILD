# Maintainer:  TEL.RED LLC <linux_at_tel_d0t_red>

pkgname=sky
pkgver=2.1.7332.1
pkgrel=1
pkgdesc="Lync and Skype for Business client on Linux"

arch=(
	'x86_64'
)
if [[ $CARCH == 'x86_64' ]]; then
	_arch=64
fi

url="https://tel.red"

license=('custom: Copyright © 2015-2018 TEL.RED LLC')
options=()
install="${pkgname}.install"

depends=(
	'curl'
	'ffmpeg'
	'libxcursor'
	'libxinerama'
	'libxkbfile'
	'libxrandr'
	'libxss'
	'libxv'
	'qt5-base>=5.6'
	'qt5-base<6.0'
	'openssl'
)
makedepends=(
	'binutils'
	'tar'
	'xz'
)

source_x86_64=("https://tel.red/repos/archlinux/sky-archlinux-${pkgver%.*}-${pkgver##*.}-${CARCH}.pkg.tar.xz")
sha256sums_x86_64=('21f940c4cca340f79f5f43fa2d025ae5302b5c48292460d51147df0257e65699')

package() {
	local _sky_libdir="/usr/lib/sky/lib64"
	local _sky_bindir="/usr/lib/sky"
	local _sky_datadir=( "${_sky_bindir}/sounds" )

	cd "${pkgdir}"
	tar -Jxf "${srcdir}/sky-archlinux-${pkgver%.*}-${pkgver##*.}-${CARCH}.pkg.tar.xz"
	find "${pkgdir}" -maxdepth 1 -type f -delete
}

# vim: set ts=2 sw=2 ft=sh noet:
