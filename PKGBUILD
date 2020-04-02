# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-pyhcl
pkgver=0.4.2
pkgrel=1
pkgdesc="Parse HCL (HashiCorp Configuration Language) into JSON"
arch=( 'i686' 'x86_64' )
url="https://pypi.org/project/pyhcl/"
license=( 'MPL2' )
depends=( 'python' 'python2' )
_pkgname=python-pyhcl
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/25/f2/119d994a33cc6601299ce83f3aaaf327843de26287486bf1941e15b1d673/pyhcl-0.4.2.tar.gz"
        "pyhcl-0.4.2.tar.gz.sig")
sha512sums=('16b280d6db2cd2444463d56fba1706a11b5db438a2f9f979143c95a735c3132e9a6a68938c218490925cd067b0898600fa459ba3ac6ac5fc75756aaf1a45d79e'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
