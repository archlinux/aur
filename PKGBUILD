# Maintainer: Ultracoolguy <dummyd241 at gmaildotcom>
pkgname="switch-lan-play"
pkgver=v0.1.0.r4.f62bf0c
pkgrel=1.2
epoch=0
pkgdesc="A program for connecting to fanmade Nintendo Switch servers--see url for more info"
arch=(any)
url="https://github.com/spacemeowx2/switch-lan-play"
license=('GPL3')
groups=()
deplaypends=(libpcap)
makedepends=(cmake)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('switch-lan-play::git+https://github.com/spacemeowx2/switch-lan-play.git')
noextract=()
md5sums=('SKIP')
gitname=switch-lan-play

pkgver() {
  cd $gitname

  git describe --tags | sed 's/-/.r/; s/-g/./'

}

build()	{
	cd $gitname
	if [[ ! -d build ]] ;then
	mkdir build
	fi
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make
}
package() {
	cd $gitname/build
	make DESTDIR="$pkgdir/" install
}

