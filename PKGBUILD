# Maintainer: Vardan Tarayan <tarayanvardan@gmail.com>
pkgname='solarbg'
pkgrel=1
pkgver="v1.0.r2.gf02c291"
pkgdesc="Sun altitude based wallpapers "
arch=('x86_64')
url="https://github.com/VardanHeroic/solarbg"
license=('GPL')
depends=('nodejs')
makedepends=('git' 'npm')
optdepends=(
	'feh: x11 tiling wm support',
	'swaybg: wlroots based wayland compositors support')
source=('solarbg::git+https://github.com/VardanHeroic/solarbg.git')
md5sums=('SKIP')


pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	npm install --production
}

package() {
	cd "$pkgname"
	appdir=/usr/lib/${pkgname} 
	bindir=/usr/bin/

	install -d "${pkgdir}"${appdir}
	cp -r * "${pkgdir}"${appdir}

	install -d "${pkgdir}"${bindir}
	cp scripts/solarbg "${pkgdir}"${bindir} 

}
