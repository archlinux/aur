pkgname=swconfig-git
_pkgname=swconfig
pkgver=20150806.4.g43e2854
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
source=(git+https://github.com/rains31/${_pkgname}.git)
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --tags | sed 's/^v//;s/-/./g'
}


package() {
  cd "$srcdir/${_pkgname}"
  make install DESTDIR=$pkgdir
} 
