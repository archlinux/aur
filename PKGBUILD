# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=quickbms
pkgver=0.8.2a
pkgrel=1
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends_i686=('lzo' 'bzip2' 'zlib' 'openssl')
depends_x86_64=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl' 'lib32-gcc-libs')
makedepends_x86_64=('gcc-multilib')
source=("quickbms_${pkgver}.zip::http://aluigi.altervista.org/papers/quickbms_src.zip" "mydownlib.patch")
sha512sums=('4464925f46073119b478d8886d4cf88fc6ac55668be4384d13dfd56195880fe8c317cc97ad7929767edb163c1ae620e61e85972d991896d1121a614b2c556f6e'
            'd856d6b39cda8206e1fc1c81680dc76a05a22009051d829fba00a7b4068c4b59bc90e9ae619be55cb3a774279a5792b049b06694e2c35958c3bb49ecccc0bf5b')

prepare() {
  cd "$srcdir"/src
  patch -Np1 -i "$srcdir"/mydownlib.patch
}

build() {
  cd "$srcdir"/src
  make
}

package() {
  cd "$srcdir"/src
  make PREFIX="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
