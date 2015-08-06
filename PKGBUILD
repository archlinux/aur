pkgname=swconfig
pkgver=20150806
pkgrel=1
pkgdesc="project to package the swconfig utility from OpenWRT for archlinuxarm on BPi-R1"
url="https://github.com/rains31/swconfig"
license=('GPL2')
depends=('libnl')
makedepends=('git' 'gcc' 'linux-headers')
provides=(${pkgname})
conflicts=(${pkgname})
options=()
arch=('armv7h')
source=(git+https://github.com/rains31/${pkgname}.git)
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --tags | sed 's/^v//;s/-/./g'
}


package() {
  cd "$srcdir/${pkgname}"
  make install DESTDIR=$pkgdir
} 
