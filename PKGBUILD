# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=blt4l-runtime-bin
pkgver=2.0_pre2_r1
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
__filename="blt4l_${pkgver//_/-}_Ubuntu_Precise_.SteamRT"
source=("https://github.com/blt4linux/blt4l/releases/download/${pkgver//_/-}/${__filename}.tar.xz")
noextract=()
md5sums=('09ed0bc01c5317e7d445311aac622207')
sha512sums=('3d4e9ca92e4fb8e6c504e7297f0792e49f89b7a3f31eb1203c4f78570103a2dda054b91a13abff09244a7d338af66bc83e971efdc23b9a5b9aa199160ac6717b')

package() {
	install -D -m644 "${srcdir}/${__filename//.SteamRT/(SteamRT)}/libblt_loader.so" "${pkgdir}/usr/lib/blt4l/libblt_loader_steamrt.so"

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
