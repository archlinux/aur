# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=blt4l-runtime-bin
pkgver=1.3_r1_1
pkgrel=1
pkgdesc="Mod loader for Payday 2 (Steam runtime, bin version)"
arch=('i686' 'x86_64')
url="https://github.com/blt4linux/blt4l"
license=('GPL3')
groups=()
depends=('curl' 'openssl' 'zlib') # 'python2' (for the installer)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=blt4l.install
__filename="blt4l_${pkgver//_/-}_Ubuntu-precise-steamrt"
source=("https://github.com/blt4linux/blt4l/releases/download/${pkgver//_/-}/${__filename}.tar.xz")
noextract=()
md5sums=('625bb2a871b628446a57818610301a36')
sha512sums=('9f2359d1fe28ed31b907a2877b6ad1eb42d297d70462d0baecff01e18b636f7d27355b64ff61355afdb4ea78f5a9d3fae7d834d5e0d33796fd95150f5a837f15')

package() {
	install -D -m644 "${srcdir}/${__filename}/libblt_loader.so" "${pkgdir}/usr/lib/blt4l/libblt_loader_steamrt.so"

	## Preliminary work on including the installer
	## I'll need to patch the installer for this to be usable.
	# # Base Lua, needed by the game
	# cp -r "${srcdir}/${__filename}/mods" "${pkgdir}/usr/lib/blt4l/mods"
	# chmod 755 "${pkgdir}/usr/lib/blt4l/mods"
	#
	# # Installer scripts
	# cp -r "${srcdir}/${__filename}/.installer" "${pkgdir}/usr/lib/blt4l/.installer"
	# chmod -R 755 "${pkgdir}/usr/lib/blt4l/.installer"
	# install -D -m755 "${srcdir}/${__filename}/install.sh" "${pkgdir}/usr/lib/blt4l/install.sh"
	#
	# # Setup the install binary
	# mkdir -p "${pkgdir}/usr/bin/"
	# ln -s "/usr/lib/blt4l/install.sh" "${pkgdir}/usr/bin/blt4l-installer"
}
