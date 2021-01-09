# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=npth-git
pkgver=1.6
pkgrel=1
pkgdesc='New portable threads library'
url='https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git'
license=('LGPL')
#options=('!libtool')
arch=('x86_64')
#validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'
#              '46CC730865BB5C78EBABADCF04376F3EE0856959'
#              '031EC2536E580D8EA286A9F22071B08A33BD3F06'
#              'D238EA65D64C67ED4C3073F28A861B1C7EFD60D9')
source=(git://git.gnupg.org/npth.git)
provides=(npth)
conflicts=(npth)
sha256sums=( 'SKIP')

pkgver() {
  cd npth
  git describe --tags | sed 's/-/+/g'
}

build() {
	cd npth
	./autogen.sh
	./configure --prefix=/usr --enable-maintainer-mode
	make
}

#check() {
#	cd npth
#	make check
#}

package() {
	cd npth
	make DESTDIR="${pkgdir}" install
}

