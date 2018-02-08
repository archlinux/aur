# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=sks-local
pkgver=1.1.6
pkgrel=1
pkgdesc="A modified version of AUR/sks that can be used in tandem to perform localized keydumps"
arch=( 'i686' 'x86_64' )
url="https://bitbucket.org/skskeyserver/sks-keyserver/"
license=( 'GPL' )
optdepends=( 'sks: for running a public instance (to be peered with)' )
makedepends=( 'ocaml' 'db' 'camlp4' )
_pkgname=sks-local
install=
changelog=
noextract=()
source=("https://bitbucket.org/skskeyserver/sks-keyserver/downloads/sks-1.1.6.tgz"
        "sks-1.1.6.tgz.sig")
sha512sums=('f7c54194274834840b9701bf827b81add0f807dd4c6019968a6b0c755c9117519433ebb1161da38d23c465b163dd31a766700023afa13174e4dc82542fa98099'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
