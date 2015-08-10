# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=tntnet
pkgver=2.2.1
pkgrel=1
pkgdesc="Modular, multithreaded, high performance webapplicationserver for C++"
url="http://www.tntnet.org"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('cxxtools' 'openssl' 'zlib')
source=("http://www.tntnet.org/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('febe799675c1b8b2f7259bad30cf6f23')

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
