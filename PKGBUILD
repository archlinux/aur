# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=quickbms
pkgver=0.9.2
pkgrel=1
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends_i686=('lzo' 'bzip2' 'zlib' 'openssl')
depends_x86_64=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl' 'lib32-gcc-libs')
makedepends_x86_64=('gcc-multilib')
source=("quickbms_${pkgver}.zip::http://aluigi.altervista.org/papers/quickbms_src.zip"
        "sse2.patch")
sha512sums=('a740e640d361f0cf04f39766f6de0864f6e508f211bd0c2c60c1a660f04f5d4dde96c4999f99e4d4cfa2965221c6ed9feaaae29df312def875c1944652654058'
            '4130528faeeb11eef56d639248e57b955b66302d2c76bcc48881ef9e9d0f159b827c851bb73d9ab24180b381539e932e21b49d732b432c81d951ffc1d575650b')

prepare() {
  cd src
  patch -Np1 -i ../sse2.patch
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
