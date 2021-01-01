# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=nullshell
pkgver=0.0.7
pkgrel=1
pkgdesc="do nothing but print keep alive characters, can be used for login shell"
arch=('i686' 'x86_64')
makedepends=('markdown')
url="https://github.com/eworm-de/nullshell"
conflicts=('nullshell-git')
license=('GPL')
install=nullshell.install
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('18a1bc47fef86781b7fa044ecb62d4ce22fe00ae3fdd6613bd977c4a6c3f07df'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

