# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: nbebaw
pkgname=boostchanger-appimage
pkgver=1.2
pkgrel=6
pkgdesc="Control your CPU Turbo Boost with this App"
arch=('any')
url="https://gitlab.com/nbebaw/boostchanger"
license=('MIT')
makedepends=('git')
source=("git+https://gitlab.com/nbebaw/boostchanger.git")
md5sums=('SKIP')

prepare() {
	rm -rf /home/${USER}/boostchanger
}

package() {
		
	mkdir /home/${USER}/boostchanger
	cd boostchanger/app
	cp boostchanger.AppImage /home/${USER}/boostchanger
	install -Dm755 boostchanger.sh ${pkgdir}/usr/bin/boostchanger
	install -Dm644 boostchanger.desktop ${pkgdir}/usr/share/applications/boostchanger.desktop
	install -Dm644 boostchanger.png ${pkgdir}/usr/share/pixmaps/boostchanger.png
}

