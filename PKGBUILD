# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=quickbms
pkgver=0.10.1
pkgrel=1
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends_i686=('lzo' 'bzip2' 'zlib' 'openssl')
depends_x86_64=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl' 'lib32-gcc-libs')
makedepends_x86_64=('gcc-multilib')
source=("https://aluigi.altervista.org/papers/quickbms-src-$pkgver.zip")
sha512sums=('f207859ca8f81ce115d2700be0932324b1ad51de7d0571d86fab2d34cc0b3a73c71270edfeb6f16f31962750e18a2ee8906b4a16c242be30db1abd336dd7d3e1')

build() {
  cd src
  make
}

package() {
  cd src
  make PREFIX="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
