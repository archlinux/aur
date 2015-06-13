# Maintainer: SanskritFritz (gmail)
# Contributor: Chris_tian (AUR)

pkgname=dead-cyborg-episode2
pkgver=002
pkgrel=1
pkgdesc='Free, donation based oldskool sci-fi adventure game with 3D first person view. Episode 2.'
arch=('i686' 'x86_64')
url='http://deadcyborg.com/'
license=('freeware' 'donationware')
depends=('openal' 'sdl' 'ffmpeg' 'libpng' 'libtiff' 'libjpeg6' 'zlib' 'python')
optdepends=('alsa-oss: for ALSA support through OSS.')
install='dead-cyborg-episode2.install'
# Yes, the source file has wrong version number. I'll report this upstream.
source=("http://deadcyborg.com/DeadCyborg_Episode2_Linux_v003.tar.bz2"
        "dead-cyborg-episode2.png" "dead-cyborg-episode2.desktop" "dead-cyborg-episode2.sh"
        "start-game_oss_fullscreen.sh" "start-game_oss.sh")
options=(!strip)

package() {
	cd $srcdir
	install -d "$pkgdir/opt/dead-cyborg-episode2"
	cp --archive DeadCyborg-Episode2-Linux_v$pkgver/* "$pkgdir/opt/dead-cyborg-episode2"
	# Fix directory permissions:
	chmod --recursive 755 "$pkgdir/opt/dead-cyborg-episode2/data"
	install -D dead-cyborg-episode2.png "$pkgdir/usr/share/pixmaps/dead-cyborg-episode2.png"
	install -D dead-cyborg-episode2.sh "$pkgdir/usr/bin/dead-cyborg-episode2"
	install -D dead-cyborg-episode2.desktop "$pkgdir/usr/share/applications/dead-cyborg-episode2.desktop"
	install -D start-game_oss_fullscreen.sh "$pkgdir/opt/dead-cyborg-episode2/start-game_oss_fullscreen.sh"
	install -D start-game_oss.sh "$pkgdir/opt/dead-cyborg-episode2/start-game_oss.sh"
}

md5sums=('570bece164be58ab909c07983f804f9f'
         '7e09a96ce0c4837308ac3eb2d660f64e'
         '211aeed09bb16ec13fe441af71d2ea87'
         'ac9be557334c323defa26dada763cb80'
         'bfe3460621b0a5ef278a7b04bcb00ac1'
         'e1c9fb3115e707ca71df837deb87b071')
