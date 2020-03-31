# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-dpath
pkgver=2.0.1
pkgrel=1
pkgdesc=" python library for accessing and searching dictionaries via /slashed/paths ala xpath"
arch=( 'i686' 'x86_64' )
url="https://pypi.org/project/dpath/"
license=( 'CUSTOM' )
depends=( 'python' )
_pkgname=python-dpath
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/d/dpath/dpath-2.0.1.tar.gz"
        "dpath-2.0.1.tar.gz.sig")
sha512sums=('4f4c2ccb91fe818127505e909c2021fec4ebf730d791ff12de720eddbb5c3f08f158e07f80332f7ab9450961a8eca92c51d9eba17fb3a3df2c34aee2dc655613'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
