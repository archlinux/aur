# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=t2scan
pkgver=0.7
pkgrel=1
pkgdesc="a small channel scan tool which generates DVB-T/T2 channels.conf files"
url="https://github.com/mighty-p/t2scan"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' 'glibc')
#gcc-libs is somehow needed on arm architecture
source=("$pkgname-$pkgver.tar.gz::https://github.com/mighty-p/t2scan/archive/v$pkgver.tar.gz")
sha256sums=('44e4b738a2beed8eb964be3d90b6da48c2d1c672d81fd8db8bbda87bcc433fcb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
