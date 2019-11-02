# Maintainer: Dimitris Kiziridis <ragouel@outlook.com>

pkgname=lzdoom-bin
pkgver=3.83a
pkgrel=1
pkgdesc="Fork of GZDoom 3.3.2 for legacy systems.."
arch=('i686' 'x86_64')
url=""
license=('GPL')
groups=('')
depends=('sdl2' 'zlib')
optdepends=('fluidsynth'
            'libsndfile'
            'mpg123'
            'openal'
            'timidity++')
options=('!strip' '!emptydirs')
source_i686=("https://github.com/drfrag666/gzdoom/releases/download/3.83a/lzdoom_3.83a_i386.deb")
source_x86_64=("https://github.com/drfrag666/gzdoom/releases/download/3.83a/lzdoom_3.83a_amd64.deb")
sha512sums_i686=('c591d1720a76c6d4c85d394808bbe354a5f9241c88914bcd8f6bc25c3fc5538389ec3c59bf33b343b22673a1474652d043ffd09b18c511e3a8f938fd36fc8a8e')
sha512sums_x86_64=('e5bccefd2eb9a8b28aa1d62e24e91f52ee5cfa3b6c529ff21acacec01ec33d9f612709f563696bb5320c93f251ea5e8a14b1b0a05b23e022972faa33fc98a678')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/games/* usr/bin; rm -rf usr/games

	cd ..

}
