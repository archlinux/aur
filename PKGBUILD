# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=quickbms
pkgver=0.8.1
pkgrel=1
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends_i686=('lzo' 'bzip2' 'zlib' 'openssl')
depends_x86_64=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl' 'lib32-gcc-libs')
makedepends_x86_64=('gcc-multilib')
source=("quickbms_${pkgver}.zip::http://aluigi.altervista.org/papers/quickbms_src.zip")
sha512sums=('77bb76b4a6b184a8f12519cf89804937a48fa07f5d1650ae63e0e5996f3bc4198429825c0b6da5fdde1ef015a2dae86c146e3c11e67f40b52ba2073a897f61e5')

build() {
  cd $srcdir/src
  make
}

package() {
  cd $srcdir/src
  make PREFIX=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:
