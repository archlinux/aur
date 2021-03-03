# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=tntnet
pkgver=3.0
pkgrel=1
pkgdesc="Modular, multithreaded, high performance webapplicationserver for C++"
url="http://www.tntnet.org"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('cxxtools' 'openssl' 'zlib' 'perl')
source=("http://www.tntnet.org/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('718e5519b0a403f7f766358bf66a85c008119c48189d1c2b7651fd0af9018e27')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --disable-static \
              --disable-unittest \
              --with-demos=no \
              --with-server=no
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
