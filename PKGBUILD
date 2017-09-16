# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=perl-app-asciio
pkgver=1.51.3
pkgrel=1
pkgdesc="Build ASCII diagrams"
arch=( 'i686' 'x86_64' )
url="http://search.cpan.org/dist/App-Asciio/lib/App/Asciio.pm"
license=( 'GPL' 'PERLARTISTIC' )
depends=( 'perl' )
_pkgname=perl-app-asciio
install=
changelog=
noextract=()
source=("http://search.cpan.org/CPAN/authors/id/N/NK/NKH/App-Asciio-1.51.3.tar.gz"
        "App-Asciio-1.51.3.tar.gz.sig")
sha512sums=('49c3f685fbb33a7bbe737107ca6e68b4f0ea7b0757601ada6dd5fce7f7dfc232f1ff178d55b5fe33fc4718290ec771454bb61eda64b85e83899b97b40b641948'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
