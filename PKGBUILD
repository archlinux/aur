# Maintainer: Stunts <f.pinamartins@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=vcftools
pkgver=0.1.14
pkgrel=1
pkgdesc="A set of tools written in Perl and C++ for working with VCF files"
arch=('x86_64')
url="https://vcftools.github.io/"
license=('LGPL3')
depends=('perl' 'zlib')
source=(https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('a110662535651caa6cc8c876216a9f77')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --with-pmdir=/usr/share/perl5/vendor_perl

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR=$pkgdir install
}
