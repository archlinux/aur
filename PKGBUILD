# Maintainer: Sulthan A. Karimov <sulthankarimov@gmail.com>
pkgname='blender-launcher-bin'
_pkgname='blenderlauncher'
pkgver=2.0.24
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
sha256sums_x86_64=('5b1aa846be9d0f2b2f3c99a9be7eb274eeeece3d54d588dc998fe5ab542529b4')

package() {
	echo [Desktop Entry] >>$srcdir/$_pkgname.desktop
	echo Name=$_pkgname >>$srcdir/$_pkgname.desktop
	echo GenericName=Launcher >>$srcdir/$_pkgname.desktop
	echo Exec=$HOME/.local/bin/$_pkgname >>$srcdir/$_pkgname.desktop
	echo Terminal=false >>$srcdir/$_pkgname.desktop
	echo Type=Application >>$srcdir/$_pkgname.desktop
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm755 "$srcdir/Blender Launcher" "$pkgdir$HOME/.local/bin/$_pkgname"
}
