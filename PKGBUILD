# Maintainer: kobe-koto <admin at koto dot cc>
pkgname="sharp-craft-launcher-bin"
_pkgname="SharpCraftLauncher"
pkgver=1.2.0
_pkgdate=20240216
pkgrel=1
pkgdesc="A super light, fast, clean minecraft launcher framework written in rust."
arch=('x86_64' 'aarch64')
url="https://github.com/Steve-xmh/scl"
license=('LGPL-3.0')
depends=(
	'openssl-1.1' 'zlib' 'gtk3' 'gdk-pixbuf2' 'gcc-libs' 'glibc' 'pango' 'harfbuzz' 
	'fontconfig' 'fribidi' 'libthai' 'libffi' 'pcre2' 'libpng' 'freetype2' 'libx11' 
	'libxext' 'libxrender' 'libxcb' 'pixman' 'glib2' 'cairo' 'at-spi2-core' 'libepoxy' 
	'libxi' 'libcloudproviders' 'tracker3' 'libxfixes' 'libxkbcommon' 'libxcursor'
	'libxdamage' 'libxcomposite' 'libxrandr' 'libxinerama' 'libjpeg-turbo' 'libtiff'
	'util-linux-libs' 'graphite' 'expat' 'libdatrie' 'bzip2' 'brotli' 'libxau'
	'libxdmcp' 'dbus' 'json-glib' 'libxml2' 'sqlite' 'zstd' 'xz' 'systemd-libs' 'icu'
	'libcap' 'libgcrypt' 'lz4' 'libgpg-error'
)
conflicts=("sharp-craft-launcher-bin")
provides=("sharp-craft-launcher")

source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${_pkgdate}-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${_pkgdate}-${pkgver}-linux-aarch64.tar.gz")
md5sums_x86_64=("SKIP")
md5sums_aarch64=("SKIP")

source=("SCL-icon.png" "SCL.desktop")
sha256sums=(
	"ac418e2a871efc0eb4393a15da1352771524fb94b998a8614e158a8ab581f6be"
	"b9201fd7dda93168660eb835363cb8262ecb177c0d2de1b2ba997b838488cdec"
)

package() {
	#mv "${srcdir}"/${_pkgname}-${_pkgdate}-${pkgver}-linux-* ${srcdir}/${_pkgname}
	install -Dm755 "${srcdir}"/${_pkgname}-${_pkgdate}-${pkgver}-* "${pkgdir}/opt/${pkgname}/${_pkgname}"
	install -Dm644 $(readlink "${srcdir}/SCL-icon.png") "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	install -Dm644 $(readlink "${srcdir}/SCL.desktop")  "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
