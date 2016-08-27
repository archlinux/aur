# Maintainer: PhotonX <photon89 [at] gmail.com>.

pkgname=xfce4-multiload-ng-plugin-git
_pkgname=multiload-ng
pkgver=r364.7c556f7
pkgrel=3
pkgdesc="A modern graphical system monitor, Xfce version"
arch=('i686' 'x86_64')
url="https://udda.github.io/multiload-ng/"
license=('GPL2')
depends=('xfce4-panel' 'libxfce4util' 'libxfce4ui' 'gtk2' 'cairo' 'libgtop')
makedepends=('git')
source=("git+https://github.com/udda/multiload-ng.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	 ./autogen.sh
	 ./configure --prefix=$pkgdir/usr --with-gtk=2.0
	 make
} 

package() {
	cd "$_pkgname"
	make install
}