# Maintainer: kinker31<dp223171@gmail.com>
pkgname=helion-bin
pkgver=0.9.8.0
pkgrel=1
pkgdesc="A modern Doom FPS engine, made with C# and GPU usage in mind (pre-compiled binary version)"
arch=('x86_64')
url="https://github.com/Helion-Engine/Helion"
license=(' GPL-3.0-or-later')
# Might be a good idea investigating if we can ignore most of the dependencies or not.
depends=('openal' 'fluidsynth' 'sdl2' 'glfw' 'zmusic>=1.1.8')
provides=('helion')
source=("https://github.com/Helion-Engine/Helion/releases/download/${pkgver}/Helion-${pkgver}-linux-x64_AOT.zip" "helion.desktop" "helion.ico")
sha256sums=('64b55aa3dd39b16d280d6fccbae70e20ba2747f5791ac958d6b430b79f16eb6d' 'dd02c430e093c2cfcdfaedfc316975af8ac47883676a05c26ac0a22a6f1b9c6b' '9590d5b920d2350a9f4ed8311f3195e619ebb168841e7d783cb652d142182c82')
package() {
	#There might be a better way of going about this, but right now this works.
	mkdir -m=644 -p "$pkgdir"/opt/Helion/SoundFonts
	install -Dm755 ./Helion "$pkgdir"/opt/Helion/
	install -Dm644 ./assets.pk3 "$pkgdir"/opt/Helion/assets.pk3
	install -Dm644 ./README.md "$pkgdir"/opt/Helion/
	install -Dm644 ./SoundFonts/Default.sf2 "$pkgdir"/opt/Helion/SoundFonts/
	mkdir -m=644 -p "$pkgdir"/usr/share/applications/
	install -Dm755 "$srcdir"/helion.desktop "$pkgdir"/usr/share/applications/helion.desktop
	install -Dm755 "$srcdir"/helion.ico "$pkgdir"/usr/share/pixmaps/helion.ico
}