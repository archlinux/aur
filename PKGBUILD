# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>

pkgname=electron-nightly-npm
pkgver=14.0.0.nightly.20210316
pkgrel=1
url='https://electronjs.org/'
pkgdesc="Build cross platform desktop apps with web technologies"
arch=('any')
license=('MIT' 'custom')
provides=('electron' 'electron-nightly')
depends=('ffmpeg' 'gtk3')
makedepends=('npm')

pkgver() {
	npm view electron-nightly version | sed 's/-/./g'
}

package() {
	mkdir -p "${pkgdir}/usr/lib/node_modules"
	npm install --prefix "$pkgdir/usr" electron-nightly -g
	cd "$pkgdir/usr"
	mv "bin/electron" "bin/electron-nightly"
	ln -s "./node_modules/electron-nightly/dist/" "./lib/electron-nightly"
}



