# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: nbebaw
pkgname=boostchanger-git
pkgver=2.8
pkgrel=0
pkgdesc="Control your CPU Turbo Boost with this App"
arch=('any')
url="https://gitlab.com/nbebaw/boostchanger"
license=('MIT')
makedepends=('git')
source=("https://gitlab.com/nbebaw/boostchanger/-/archive/v$pkgver/boostchanger-v$pkgver.tar.gz")
md5sums=('SKIP')

prepare() {
	pkgverold=2.6
	rm -rf ${pkgdir}/opt/boostchanger-v$pkgverold
	tar -xf boostchanger-v$pkgver.tar.gz
}

package() {
	mkdir -p ${pkgdir}/opt
        cd boostchanger-v$pkgver/app
        cp -r boostchanger-v$pkgver ${pkgdir}/opt	
	install -Dm755 boostchanger.sh ${pkgdir}/usr/bin/boostchanger
	install -Dm644 boostchanger.desktop ${pkgdir}/usr/share/applications/boostchanger.desktop
	install -Dm644 boostchanger.png ${pkgdir}/usr/share/pixmaps/boostchanger.png
}

