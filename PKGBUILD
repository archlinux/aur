# Maintainer: Sulthan A. Karimov <sulthankarimov@gmail.com>
pkgname='blender-launcher-bin'
_pkgname='blenderlauncher'
pkgver=2.6.1
pkgtarget='_Linux_x64'
pkgrel=1
pkgdesc='Blender Launcher is a standalone software client that provides management for stable, daily and experimental builds of Blender 3D. It is a free open source project available for 64-bit Windows and Linux (GLIBC 2.31 and higher) operating systems.'
arch=('x86_64')
url='https://github.com/Victor-IX/Blender-Launcher-V2'
license=('GPL-3.0')
#depends=('glibc')
#optdepends=()
#conflicts=('ablavema' 'ablavema-git')
source_x86_64=("$url/releases/download/v$pkgver/Blender_Launcher_v$pkgver$pkgtarget.zip")
sha256sums_x86_64=('545dda22a203e16a49d6bee7a0ec9bc2434fe48cf36fc2837a0809751eafafe2')

package() {
	install -Dm644 "$srcdir/extras/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "$srcdir/source/resources/icons/bl/bl_128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
	install -Dm755 "$srcdir/dist/release/Blender Launcher" "$pkgdir/usr/bin/$_pkgname"
}
