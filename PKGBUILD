# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributer: imachine <m.jedrasik@gmail.com>
# Contributor: c_14 <archmailing5@gmail.com>
pkgname=sex
pkgver=1.0
pkgrel=3
pkgdesc="Spouts silly mad-lib-style porn-like text"
url="http://spatula.net/software/sex/"
license=('public domain')
depends=()
arch=('any')
makedepends=('gcc')
source=(http://spatula.net/software/sex/sex-1.0.tar.gz)
md5sums=('c35a3cfe1536f1b2a16102526a74edd6')
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  gcc -o sex sex.c
  gzip sex.6
}
 
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 sex "$pkgdir/usr/bin/sex"
    install -Dm644 sex.6.gz "$pkgdir/usr/share/man/man6/sex.6.gz"
}
