# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=nullshell
pkgver=0.0.6
pkgrel=4
pkgdesc="do nothing but print keep alive characters, can be used for login shell"
arch=('i686' 'x86_64')
makedepends=('markdown')
url="https://github.com/eworm-de/nullshell"
conflicts=('nullshell-git')
license=('GPL')
install=nullshell.install
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('8ed1d29df5a8f6639f559b7a294010791d20140e85106cb0d34e6a1c194b31c9'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

