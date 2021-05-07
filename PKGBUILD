# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=nikwi-deluxe-bin
_pkgname='Nikwi Deluxe'
pkgver=1
pkgrel=1
pkgdesc="platform game where the goal is to collect candies"
arch=('x86_64')
url="http://runtimeterror.com/games/nikwideluxe"
license=('GPL')
depends=('sdl' 'sdl_image')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/n/nikwi/nikwi_0.0.20120213-4build1_amd64.deb")
md5sums=('fc20614327cbb40dd3c6f1831016205d')

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	wget "http://archive.ubuntu.com/ubuntu/pool/universe/n/nikwi/nikwi-data_0.0.20120213-4build1_all.deb"
	ar vx nikwi-data_0.0.20120213-4build1_all.deb
	tar xf data.tar.xz -C "${pkgdir}"
	mkdir ${pkgdir}/usr/bin
	mv ${pkgdir}/usr/games/nikwi ${pkgdir}/usr/bin/nikwi
	rmdir ${pkgdir}/usr/games
}
