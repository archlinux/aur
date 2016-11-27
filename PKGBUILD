# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=tox-prpl
pkgver=0.5.1
pkgrel=1
pkgdesc='Tox protocol plugin for pidgin / libpurple'
arch=('i686' 'x86_64')
url='http://tox.dhs.org/'
license=('GPL3')
depends=('libpurple' 'toxcore')
makedepends=('git' 'libconfig')
optdepends=('pidgin: Use tox in pidgin messenger')
options=('!libtool')
conflicts=('tox-prpl')
provides=('tox-prpl')
source=('git://github.com/jin-eld/tox-prpl.git')
sha256sums=('SKIP')

build() {
	cd tox-prpl/

	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd tox-prpl/

	make DESTDIR="$pkgdir" install
}

