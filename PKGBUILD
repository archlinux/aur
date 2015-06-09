#Maintainer: < aur at ajs124 dot de >

pkgname=sintel-game
pkgver=alpha_2
pkgrel=1
pkgdesc="A game to the OpenMovie Sintel created by the Blender Foundation"
arch=('i686' 'x86_64')
url="http://www.sintelgame.org"
depends=('blender')
source=("http://download.sintelgame.org/sintel_the_game_${pkgver}_nofilm.zip"
	$pkgname)
sha256sums=('fff2719aa976d09d0f67f32939ea8a516f4cc4754fbc215ffab60473761ed8c5'
            'd69416c0e07be49e42647dec878364a7751a839822e5dfe4ac63552d746da2f9')
license=('CC-BY')
PKGEXT=".pkg.tar"

package () {
	cd ${srcdir}/sintel_the_game_$pkgver
	install -d ${pkgdir}/opt/${pkgname}
	cd sintel_win64
	rm -rf *.exe *.dll 2.68 ../sintel_win32
	cd ..
	cp -R * ${pkgdir}/opt/${pkgname}
	chown -R root:games ${pkgdir}/opt/${pkgname}

	install -D -m755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

