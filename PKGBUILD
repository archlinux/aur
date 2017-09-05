# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=nroffedit
pkgver=2.08
pkgrel=1
pkgdesc="WYSIWYG Internet-Draft Nroff Editor"
arch=( 'i686' 'x86_64' )
url="http://aaa-sec.com/nroffedit/"
license=( 'CUSTOM' )
depends=( 'java-runtime-common' )
_pkgname=nroffedit
install=
changelog=
noextract=()
source=("http://aaa-sec.com/pub/NroffEdit/NroffEditJar208.zip"
        "NroffEditJar208.zip.sig")
sha512sums=('d1afbe6355743ce7af562bb6502b6cfb7184b38e0e8b5d60f3fe98c5ea9f655a994fad4cac91d2e6f93204368afffb8d708fd84e60a67f4e0ab4b584d2404bd6'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
