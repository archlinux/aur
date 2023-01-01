# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: nbebaw
pkgname=boostchanger-git
pkgver=5.0
pkgrel=1
pkgdesc="Control your CPU Turbo Boost with this App"
arch=('any')
url="https://github.com/nbebaw/boostchanger"
license=('MIT')
makedepends=('git' 'wget' 'unzip')
source=("https://github.com/nbebaw/boostchanger/releases/download/v$pkgver.$pkgrel/boostchanger-$pkgver.$pkgrel.zip")
md5sums=('SKIP')

prepare() {
	pkgverold=5.0.1
	rm -rf ${pkgdir}/opt/boostchanger-$pkgverold
	unzip -d boostchanger-$pkgver.$pkgrel boostchanger-$pkgver.$pkgrel.zip 
}

package() {
	mkdir -p ${pkgdir}/opt
	cp -r boostchanger-$pkgver.$pkgrel ${pkgdir}/opt
	wget https://github.com/nbebaw/boostchanger/archive/v$pkgver.$pkgrel.zip
	unzip v$pkgver.$pkgrel.zip
	install -Dm755 boostchanger-$pkgver.$pkgrel/build/boostchanger.sh ${pkgdir}/usr/bin/boostchanger
	install -Dm644 boostchanger-$pkgver.$pkgrel/build/boostchanger.desktop ${pkgdir}/usr/share/applications/boostchanger.desktop
	install -Dm644 boostchanger-$pkgver.$pkgrel/build/icon.png ${pkgdir}/usr/share/pixmaps/boostchanger.png
	rm -rf boostchanger-$pkgver.$pkgrel
	rm v$pkgver.$pkgrel.zip
}

