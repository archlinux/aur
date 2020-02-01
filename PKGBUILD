# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=t2scan
pkgver=0.5
pkgrel=1
pkgdesc="a small channel scan tool which generates DVB-T/T2 channels.conf files"
url="https://github.com/mighty-p/t2scan"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' 'glibc')
#gcc-libs is somehow needed on arm architecture
source=("$pkgname-$pkgver.tar.gz::https://github.com/mighty-p/t2scan/archive/v$pkgver.tar.gz")
sha256sums=('44d26c917761b9e520f739a72565a9dbbb7a724eefa4f2c6e9045bead5158281')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
