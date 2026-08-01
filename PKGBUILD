# Maintainer: kinker31<dp223171@gmail.com>
pkgname=helion-bin
pkgver=1.0.0.0
pkgrel=1
pkgdesc="A modern Doom FPS engine, made with C# and GPU usage in mind (pre-compiled binary version)"
arch=('x86_64')
url="https://github.com/Helion-Engine/Helion"
license=(' GPL-3.0-or-later')
# Might be a good idea investigating if we can ignore most of the dependencies or not.
depends=('libsndfile' 'mpg123' 'gcc-libs' 'alsa-lib' 'glibc' 'glib2')
provides=('helion')
conflicts=(helion)
source=("https://github.com/Helion-Engine/Helion/releases/download/${pkgver}/Helion-${pkgver}-linux-x64_AOT.zip")
sha256sums=('5589253529f3e7bd2668c384d2a9e127f0068eac2c3a44eeec1a1235d2cdf840')
package() {
	#There might be a better way of going about this, but right now this works.
	mkdir -m=755 -p "$pkgdir"/opt/Helion/SoundFonts
	install -Dm755 ./Helion "$pkgdir"/opt/Helion/
	install -Dm644 ./assets.pk3 "$pkgdir"/opt/Helion/
	install -Dm644 ./README.md "$pkgdir"/opt/Helion/
	install -Dm644 ./SoundFonts/Default.sf2 "$pkgdir"/opt/Helion/SoundFonts/
	mkdir -m=755 -p "$pkgdir"/usr/share/applications/
	# Dunno if these just aren't included in the repo, should check later.	
	# install -Dm755 "$srcdir"/Helion-${pkgver}/Assets/Misc/Helion.desktop "$pkgdir"/usr/share/applications/Helion.desktop
	# install -Dm755 "$srcdir"/Helion-${pkgver}t/Assets/Misc/helion.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/Helion.svg
}