# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: nbebaw
pkgname=boostchanger-appimage
pkgver=1.4
pkgrel=6
pkgdesc="Control your CPU Turbo Boost with this App"
arch=('any')
url="https://gitlab.com/nbebaw/boostchanger"
license=('MIT')
makedepends=('git')
source=("https://gitlab.com/nbebaw/boostchanger/-/archive/v$pkgver/boostchanger-v$pkgver.tar.gz")
md5sums=('SKIP')

prepare() {
	sudo -S rm -rf /etc/boostchanger-v$pkgver
	tar -xf boostchanger-v$pkgver.tar.gz
}

package() {
	sudo -S mkdir -p /etc/boostchanger-v$pkgver
        cd boostchanger-v$pkgver/app
        sudo -S cp boostchanger.AppImage /etc/boostchanger-v$pkgver	
	install -Dm755 boostchanger.sh ${pkgdir}/usr/bin/boostchanger
	install -Dm644 boostchanger.desktop ${pkgdir}/usr/share/applications/boostchanger.desktop
	install -Dm644 boostchanger.png ${pkgdir}/usr/share/pixmaps/boostchanger.png
}

