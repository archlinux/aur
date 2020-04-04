# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lzdoom-bin')
pkgver='3.85'
pkgrel=1
pkgdesc='Fork of GZDoom 3.3.2 for legacy systems'
arch=('i686' 'x86_64')
url='https://www.zdoom.org/downloads'
license=('GPL-3.0')
depends=('sdl2' 'zlib')
optdepends=('fluidsynth' 'libsndfile' 'mpg123' 'openal' 'timidity++')
options=('!strip' '!emptydirs')
source_i686=("https://github.com/drfrag666/gzdoom/releases/download/${pkgver}/lzdoom_${pkgver}_i386.deb")
source_x86_64=("https://github.com/drfrag666/gzdoom/releases/download/${pkgver}/lzdoom_${pkgver}_amd64.deb")
sha512sums_i686=('837160c74a6b086cb2e4a3cb82215ee82b164cdc15df2c823873f05f6f0cc8f1f93335ca0cb899bb7d24b5788b7e07f1a811a65af6395e058abea855e43d5f3e')
sha512sums_x86_64=('8a6880e69b4c40425b0dd332d1be1ced88c08778a1f5738611f7a69d701ca0569c58651d37cdcc0492a50fea8078b3b49fc79821e3befaf5f02b465d6869958f')

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	cd "${pkgdir}"
	mkdir usr/bin
	mv usr/games/* usr/bin
	rm -rf usr/games
}
# vim:set ts=2 sw=2 et: