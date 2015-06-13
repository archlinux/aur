# Contributor: Manuel Unglaub <m.unglaub@gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=silence-git
_gitname=silence
pkgver=2012.10.07
pkgrel=1
pkgdesc="An information management tool."
arch=('i686' 'x86_64')
url="http://silence.sekalura.net"
license=('GPL2 only')
depends=('kdebase-runtime')
makedepends=('cmake' 'git')
provides=('silence')
conflicts=('silence')
source=("git://gitorious.org/silence/silence.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
  cd "$_gitname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install

}
