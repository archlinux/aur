# Maintainer: oliver < a t >  first . in-berlin . de

pkgname=any-dl
pkgver=0.20.0
pkgrel=2
pkgdesc="Generic video downloader for principially any site."
arch=('i686' 'x86_64')
license=('GPL3')
source=(http://www.first.in-berlin.de/software/tools/any-dl/any-dl-$pkgver.tgz)
md5sums=('82cd2e7177c8b542d38b5433d74a6c45')
url="http://www.first.in-berlin.de/software/tools/any-dl/"
depends=('ocaml' 'ocaml-pcre' 'ocaml-xmlm' 'ocamlnet' 'gnutls' 'ocaml-csv' 'ocaml-yojson')
makedepends=('ocaml-findlib')
options=(!makeflags)

build() {
cd ${srcdir}/${pkgname}-${pkgver}
make
}


package() {
cd ${srcdir}/${pkgname}-${pkgver}

install -Dm 755 any-dl ${pkgdir}/usr/bin/any-dl      # install binary to Arch-Linux path
install -Dm 644 rc-file.adl ${pkgdir}/etc/any-dl.rc  # install config-file to /etc/
}
