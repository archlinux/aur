# Maintainer: Maciej Mazur <mamciek@gmail.com>
pkgname=alttab-git
_name=alttab
pkgver=v1.0.3.10.gf51b590
pkgrel=1
pkgdesc="The task switcher for minimalistic window managers or standalone X11 session"
url="https://github.com/sagb/alttab"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('libx11' 'libxmu' 'libxft')
makedepends=('autoconf' 'automake')
source=("git+https://github.com/sagb/alttab.git#branch=master")
sha1sums=('SKIP')

pkgver() {
	cd "$_name"
	git describe --tags |sed 's/-/./g'
}

build() {
	pwd
	ls -al
	cd "$_name"
	./configure --prefix=/usr
	make
}

package() {
	pwd
	ls -al
	cd "$_name"
	make DESTDIR="$pkgdir/" install
}
