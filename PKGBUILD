# Maintainer:  TEL.RED LLC <linux_at_tel_d0t_red>

pkgname=sky
pkgver=2.1.6837
pkgrel=201706161006
pkgdesc="Lync and Skype for Business client on Linux"

arch=(
	'x86_64'
)
if [[ $CARCH == 'x86_64' ]]; then
	_arch=64
fi

url="http://tel.red"

license=('custom: Copyright © 2015-2017 TEL.RED LLC')
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
	'qt5-base<5.10'
	'qt5-webengine>=5.6'
	'qt5-webengine<5.10'
	'openssl'
)
makedepends=(
	'binutils'
	'tar'
	'xz'
)

source_x86_64=("https://tel.red/linux/sky-archlinux-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz")
sha256sums_x86_64=('ed0cae732d003bf9c3c0f4b0d739b1d3e51bf5f04cdda11da0c2d874f8a2aee8')

package() {
	local _sky_libdir="/usr/lib/sky/lib64"
	local _sky_bindir="/usr/lib/sky"
	local _sky_datadir=( "${_sky_bindir}/sounds" )

	cd "${pkgdir}"
	tar -Jxf "${srcdir}/sky-archlinux-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz"
	find "${pkgdir}" -maxdepth 1 -type f -delete
}

# vim: set ts=2 sw=2 ft=sh noet:
