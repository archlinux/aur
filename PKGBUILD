# Maintainer: romanra <romanra (at) posteo (dot) net>

pkgname=quickbms
pkgver=0.11.0
pkgrel=1
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends_i686=('lzo' 'bzip2' 'zlib' 'openssl')
depends_x86_64=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl' 'lib32-gcc-libs')
makedepends_x86_64=('gcc-multilib')
source=("https://aluigi.altervista.org/papers/quickbms-src-$pkgver.zip"
        "fix-compile.patch")
sha512sums=('edc50882650449b64afa5900f861766ce1c3d6a11eceffdc52f3cae0158df7d13ff33af0c9ced21fda01f575930b331bf003c314c7c37b4786ca93cbacb851df'
            '4b3086cff280700f88ddc9d9d48037e76358a6995d6862014a602d54fd19a759095294ea0ea679f68b63d5cef1ae14d9c86bd1fe739c7a4c8276a322dbdf6549')

prepare() {
  cd src
  patch -Np2 < ../fix-compile.patch
}

build() {
  cd src
  make
}

package() {
  cd src
  make PREFIX="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
