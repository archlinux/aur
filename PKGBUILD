# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=q2pro
pkgver=1093
pkgrel=1
pkgdesc="An enhanced Quake 2 client and server"
arch=( 'i686' 'x86_64' )
url="http://skuller.net/q2pro/"
license=( 'GPL2' )
_pkgname=q2pro
conflicts=( 'pkg''pkg')
install=
changelog=
noextract=()
source=("https://github.com/AndreyNazarov/q2pro/archive/r1093.tar.gz"
        "r1093.tar.gz.sig")
sha512sums=('2cca3504681ff9a2cab6c1061245c660f1bfbfd1ec4acf91a798b697ed62b029d0cda969830d7ad282e5cbbd004b766285212e723340c5c98a31ddef0e034aa1'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
