# Maintainer:  TEL.RED LLC <linux_at_tel_d0t_red>

pkgname=sky
pkgver=2.1.7613
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
	'qt5-base>=5.15'
	'openssl'
)
makedepends=(
	'binutils'
	'tar'
	'xz'
)

# source_x86_64=("https://tel.red/repos/archlinux/sky-archlinux-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz")
source_x86_64=("https://tel.red/repos/archlinux/sky-archlinux-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst")
sha256sums_x86_64=('cec12e235c1639a270dbe634a3f849f99488d8795fcf88d33e491f286123252c')

package() {
	local _sky_libdir="/usr/lib/sky/lib64"
	local _sky_bindir="/usr/lib/sky"
	local _sky_datadir=( "${_sky_bindir}/sounds" )

	cd "${pkgdir}"
	# tar -Jxf "${srcdir}/sky-archlinux-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
	tar -Jxf "${srcdir}/sky-archlinux-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst"
	find "${pkgdir}" -maxdepth 1 -type f -delete
}

# vim: set ts=2 sw=2 ft=sh noet:
