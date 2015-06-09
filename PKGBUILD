# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Anh Hai Trinh <anh.hai.trinh@gmail.com>

pkgname=so-synth-lv2-git
_pkgname=So-synth-LV2
pkgver=20110609.e7ff3d5
pkgrel=2
pkgdesc="LV2 ports of the SO-404, SO-KL5, and SO-666 synthesizers"
arch=('i686' 'x86_64')
url="https://github.com/jeremysalwen/So-synth-LV2"
license=('GPL3')
groups=('lv2-plugins')
depends=('libsigc++' 'gtkmm' 'lv2')
makedepends=('git')
source=("git://github.com/jeremysalwen/So-synth-LV2.git")
md5sums=('SKIP')
conflicts=("so-synth-lv2")
provides=("so-synth-lv2")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package () {
	cd "${srcdir}/${_pkgname}"
	DESTDIR=$pkgdir make install
}
