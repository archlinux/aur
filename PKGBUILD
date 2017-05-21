# Maintainer: oliver < a t >  first . in-berlin . de

pkgname=any-dl
pkgver=0.22.0
pkgrel=1
pkgdesc="Generic video downloader for principially any site."
arch=('i686' 'x86_64')
license=('GPL3')
source=(https://github.com/klartext/any-dl/archive/v."$pkgver".tar.gz)
md5sums=('1ccfa362ddbaf332e5c9ce6f88000600')
url="http://www.first.in-berlin.de/software/tools/any-dl/"
depends=('ocaml' 'ocaml-pcre' 'ocaml-xmlm' 'ocamlnet' 'gnutls' 'ocaml-csv' 'ocaml-yojson')
makedepends=('ocaml-findlib')
options=(!makeflags)

build() {
cd ${srcdir}/${pkgname}-v.${pkgver}
make
}


package() {
cd ${srcdir}/${pkgname}-v.${pkgver}

install -Dm 755 any-dl ${pkgdir}/usr/bin/any-dl      # install binary to Arch-Linux path
install -Dm 644 rc-file.adl ${pkgdir}/etc/any-dl.rc  # install config-file to /etc/
}
