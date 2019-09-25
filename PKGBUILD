# Maintainer: faith <valters.tomsons@protonmail.com>
pkgname=rpcs3-git-bin
pkgver=0.0.7
pkgrel=1
pkgdesc='Open-source Sony Playstation 3 Emulator (binary AppImage)'
arch=('x86_64')
url='https://rpcs3.net'
license=('GPL2')
provides=('rpcs3')
conflicts=('rpcs3')
depends=('ffmpeg' 'glew' 'openal' 'qt5-declarative' 'vulkan-icd-loader')
options=(!strip)
noextract=('rpcs3-latest.AppImage')

prepare()
{
	cd "$srcdir"
	curl -JL https://rpcs3.net/latest-appimage > rpcs3-latest.AppImage
}

package()
{
	cd "$srcdir"
	install -Dm755 "$srcdir/rpcs3-latest.AppImage" "$pkgdir/usr/bin/rpcs3"
}
