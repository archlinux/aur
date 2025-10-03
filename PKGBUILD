# Maintainer: Digital Artifex <7929434+DigitalArtifex@users.noreply.github.com>

pkgname="plasma6-wallpapers-komplex-bin"
pkgver=1.0.6
pkgrel=1
pkgdesc="Complex shader arrangements as a desktop background"
arch=('x86_64')
provides=("plasma6-wallpapers-komplex")
conflicts=("plasma6-wallpapers-komplex")
url="https://github.com/DigitalArtifex/kde-komplex-wallpaper-engine"
license=('GPLv3')
depends=('glib2' 'glibc' 'plasma-desktop' 'qt6-base' 'pipewire' 'fftw' 'qt6-multimedia' 'qt6-multimedia-gstreamer' 'qt6-declarative' 'qt6-imageformats' 'qt6-quick3d' 'qt6-shadertools')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'fftw' 'libpipewire')
backup=('etc/profile')
install='komplex.install'
changelog='changelog'
source=('https://github.com/DigitalArtifex/kde-komplex-wallpaper-engine/releases/download/1.0.6/plasma6-wallpapers-komplex_1-0-6_linux_x86.tar.gz')
sha256sums=('SKIP')

# build() {
# }

package() {
	tar -xvzf plasma6-wallpapers-komplex_1-0-6_linux_x86.tar.gz
	cd plasma6-wallpapers-komplex_1-0-6_linux_x86
	install -d "$pkgdir/usr/share/komplex/"
	cp -r data/* "$pkgdir/usr/share/komplex/"
	chmod -R 755 "$pkgdir/usr/share/komplex/"

	#install module
	install -d "$pkgdir/usr/lib/qt6/qml/com/github/digitalartifex/komplex/"
	cp -r src/module/* "$pkgdir/usr/lib/qt6/qml/com/github/digitalartifex/komplex/"

	#install metainfo
	install -d "$pkgdir/usr/share/metainfo"
	cp -r src/metainfo/* "$pkgdir/usr/share/metainfo"

	#install plugin
	install -d "$pkgdir/usr/share/plasma/wallpapers/com.github.digitalartifex.komplex/"
	cp -r src/plugin/* "$pkgdir/usr/share/plasma/wallpapers/com.github.digitalartifex.komplex/"
	cp -r src/libkomplex.so "$pkgdir/usr/lib/"
}
