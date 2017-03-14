# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=ietf-cli
pkgver=1.14
pkgrel=1
pkgdesc="A commandline IETF RFC browser/utility"
arch=( 'i686' 'x86_64' )
url="https://trac.tools.ietf.org/tools/ietf-cli/"
license=( 'WTFPL' )
depends=( 'python' )
_pkgname=ietf-cli
install=
changelog=
noextract=()
source=("http://svn.tools.ietf.org/svn/tools/ietf-cli/ietf"
        "ietf.sig")
sha512sums=('cf16db6148c1110c6ff60995ada6354da3227be7ecf5e76df68ee05843a602fd5cf1e9ba1de9128efa84fc1c1e33de69d9db08c58f1cb565bdafe3e76191a6f0'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
