# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-whois
pkgver=0.6.5
pkgrel=1
pkgdesc="Whois querying and parsing of domain registration information"
arch=( 'i686' 'x86_64' )
url="https://bitbucket.org/richardpenman/pywhois"
license=( 'CUSTOM' )
depends=( 'python' 'python2' )
makedepends=( 'python' 'python2' 'python-setuptools' 'python2-setuptools' )
_pkgname=python-whois
install=
changelog=
noextract=()
source=("https://pypi.python.org/packages/c0/02/b663e0981606224657251b8bd64c95e0cfb74c9632585ab892f63420d929/python-whois-0.6.5.tar.gz#md5=af4a64d4a14df8af9907cf27edc069c0"
        "python-whois-0.6.5.tar.gz#md5=af4a64d4a14df8af9907cf27edc069c0.sig")
sha512sums=('23d328ed45593b814079f52e24ca1df0d4db90cec5bc5ac8f5a4a1975458871511828ce0180b08c8edf9716ad0628eef38e087e6b9941e53636636332e5c5dc1'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
