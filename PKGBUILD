#Maintainer: Narazaka <https://narazaka.net/>

pkgname=ninix-aya-py-git
pkgver=r657.d48d0bc
pkgrel=1
pkgdesc="Ukagaka baseware ninix-aya python version"
arch=(i686 x86_64)
url="http://ninix-aya.osdn.jp"
license=(GPL)
depends=(python pygtk python-gobject pygobject-devel python-cairo python-numpy python-chardet)
optdepends=(gstreamer)

source=(git://git.osdn.jp/gitroot/ninix-aya/master.git)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/master
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/master
  make
}

package() {
  cd ${srcdir}/master
  make DESTDIR="${pkgdir}" prefix=/usr install
}
