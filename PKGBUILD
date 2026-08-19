# Maintainer: Joseph Dalrymple <joseph.dalrymple@bluelogicteam.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Toolybird <toolybird at tuta dot io>

pkgbase=godot-double-bin
pkgname=(godot-double-bin godot-double-mono-bin)
pkgver=4.7.2
pkgrel=1
pkgdesc='Advanced cross-platform 2D and 3D game engine (double-precision build)'
arch=('x86_64' )
url="https://godotengine.org/"
license=('MIT' )
depends=('brotli' 'ca-certificates' 'embree' 'freetype2' 'graphite' 'libglvnd' 'libspeechd' 'libsquish' 'libtheora' 'libvorbis' 'libwebp' 'libwslay' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr' 'miniupnpc' 'openxr' 'pcre2' )
optdepends=('pipewire-alsa: for audio support' 'pulse-native-provider: for audio support' )
source=("godot-double-4.7.2-1-x86_64.pkg.tar.zst::https://github.com/Norpyx-Godot/godot-double/releases/download/v4.7.2-1/godot-double-4.7.2-1-x86_64.pkg.tar.zst"
        "godot-double-mono-4.7.2-1-x86_64.pkg.tar.zst::https://github.com/Norpyx-Godot/godot-double/releases/download/v4.7.2-1/godot-double-mono-4.7.2-1-x86_64.pkg.tar.zst")
noextract=("godot-double-4.7.2-1-x86_64.pkg.tar.zst" "godot-double-mono-4.7.2-1-x86_64.pkg.tar.zst")
sha256sums=('9b17c17c515f77d59580375f09622ad17d7891151fda505f83220db49513aa36'
            '54649012b20d53d668232eef0688126a1f86786e4a68923b749cfb994478565a')

package_godot-double-bin() {
	provides=("godot-double")
	conflicts=("godot-double")
	bsdtar -xf "${srcdir}/godot-double-4.7.2-1-x86_64.pkg.tar.zst" -C "${pkgdir}" --strip-components=0 usr
}

package_godot-double-mono-bin() {
	provides=("godot-double-mono")
	conflicts=("godot-double-mono")
	depends+=(dotnet-sdk-8.0)
	bsdtar -xf "${srcdir}/godot-double-mono-4.7.2-1-x86_64.pkg.tar.zst" -C "${pkgdir}" --strip-components=0 usr
}
