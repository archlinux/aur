# Maintainer: mrAppleXZ <mr.applexz@gmail.com> 

pkgname=vmware-auto-unlocker-git
pkgver=v1.1.r5.g79ef82d
pkgrel=1
pkgdesc="Unlocker for VMWare macOS"
arch=('x86_64')
url="https://github.com/paolo-projects/auto-unlocker/"
license=('GPL3')
depends=(curl libarchive zlib)
makedepends=(git cmake)
provides=(vmware-auto-unlocker)
conflicts=(vmware-auto-unlocker)
source=("git+https://github.com/paolo-projects/auto-unlocker.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd "auto-unlocker"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "auto-unlocker"
  make
}

package() {
  cd "auto-unlocker"
  make install DESTDIR="$pkgdir"  
}
