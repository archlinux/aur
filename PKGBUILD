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
pkgver=4.7.1
pkgrel=1
pkgdesc='Advanced cross-platform 2D and 3D game engine (double-precision build)'
arch=('x86_64' )
url="https://godotengine.org/"
license=('MIT' )
depends=('brotli' 'ca-certificates' 'embree' 'freetype2' 'graphite' 'libglvnd' 'libspeechd' 'libsquish' 'libtheora' 'libvorbis' 'libwebp' 'libwslay' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr' 'miniupnpc' 'openxr' 'pcre2' )
optdepends=('pipewire-alsa: for audio support' 'pulse-native-provider: for audio support' )
source=("godot-double-4.7.1-1-x86_64.pkg.tar.zst::https://github.com/Norpyx-Godot/godot-double/releases/download/v4.7.1-1/godot-double-4.7.1-1-x86_64.pkg.tar.zst"
        "godot-double-mono-4.7.1-1-x86_64.pkg.tar.zst::https://github.com/Norpyx-Godot/godot-double/releases/download/v4.7.1-1/godot-double-mono-4.7.1-1-x86_64.pkg.tar.zst")
noextract=("godot-double-4.7.1-1-x86_64.pkg.tar.zst" "godot-double-mono-4.7.1-1-x86_64.pkg.tar.zst")
sha256sums=('3a8d61b1ef8d18156218729303e100b935035c2f4673913d7c2f62e9b4832249'
            'c9f3ddfb2aadee4f6dbed7203c8d43f6eed9e328a5ccd14f1e926c8e90913b18')

package_godot-double-bin() {
	provides=("godot-double")
	conflicts=("godot-double")
	bsdtar -xf "${srcdir}/godot-double-4.7.1-1-x86_64.pkg.tar.zst" -C "${pkgdir}" --strip-components=0 usr
}

package_godot-double-mono-bin() {
	provides=("godot-double-mono")
	conflicts=("godot-double-mono")
	depends+=(dotnet-sdk-8.0)
	bsdtar -xf "${srcdir}/godot-double-mono-4.7.1-1-x86_64.pkg.tar.zst" -C "${pkgdir}" --strip-components=0 usr
}
