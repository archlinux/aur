# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=rainbowcrack
pkgver=1.7
pkgrel=1
pkgdesc="Rainbow table generation/use"
arch=( 'i686' 'x86_64' )
url="http://project-rainbowcrack.com"
license=( 'CUSTOM' )
_pkgname=rainbowcrack
install=
changelog=
noextract=()
source=("http://project-rainbowcrack.com/rainbowcrack-1.7-linux64.zip"
        "rainbowcrack-1.7-linux64.zip.sig")
sha512sums=('068fe9d31004e08c0fcbe5a11500bd6248eca2f204a8d99a7343824ebc1dd847a01eb459f28d77fdd84eae98b05169a69e10b8893b9b5dd027381965c19b7bdb'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
