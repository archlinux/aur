# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_projname=arping
_suffix=-th # this is to avoid clashing with iputils
pkgname=${_projname}${_suffix}
pkgver=2.16
pkgrel=1
epoch=
pkgdesc="ARP Ping from Thomas Habets"
arch=('i686' 'x86_64')
url="http://www.habets.pp.se/synscan/programs.php"
license=('GPL')
groups=()
depends=('libnet' 'libcap' 'libpcap')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/ThomasHabets/${_projname}/archive/${_projname}-${pkgver}.tar.gz")
md5sums=('1452c61277fa56a14b3e53caf6985277')
sha1sums=('a6a33da6853cab19a8cfa389117e8a6c1c68ce26')
noextract=()
validpgpkeys=()

prepare() {
	cd "${_projname}-${_projname}-$pkgver"
    true
}

build() {
	cd "${_projname}-${_projname}-$pkgver"
    autoreconf -i
	./configure --prefix=/usr --program-suffix=${_suffix} --sbindir=/usr/bin
	make
}

check() {
	cd "${_projname}-${_projname}-$pkgver"
}

package() {
	cd "${_projname}-${_projname}-$pkgver"
	make DESTDIR="$pkgdir/" install
}
