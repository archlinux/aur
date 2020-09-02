# Maintainer: fkxxyz <fkxxyz@163.com>
# Contributer: fkxxyz <fkxxyz@163.com>

pkgname=libv4l-rkmpp
pkgver=1.3.2
pkgrel=1
pkgdesc="A rockchip-mpp V4L2 wrapper plugin for chromium V4L2 VDA/VEA."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/JeffyCN/libv4l-rkmpp"
license=('LGPL')
depends=('v4l-utils-rockchip' 'rockchip-mpp' 'librga')
_commit='7e8d182be9d2b32e58d9c5bd7d965feba90cb3f2'
source=(git+https://github.com/JeffyCN/libv4l-rkmpp.git#commit=$_commit)
sha256sums=('SKIP')

build() {
  cd $pkgname
  LANG=C autoreconf -i --force
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR=${pkgdir} install
}

