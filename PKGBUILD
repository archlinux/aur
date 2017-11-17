# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=dhcplease
pkgver=1.0.0
pkgrel=1
pkgdesc="A parser for dhcpcd lease files (/var/lib/dhcpcd/dhcpcd*.leases)"
arch=('i686' 'x86_64')
url="https://github.com/igordcard/dhcplease"
license=( 'GPL3' )
_pkgname=dhcplease
conflicts=('dhcplease-git')
install=
changelog=
noextract=()
source=("https://github.com/igordcard/${pkgname}/archive/v${pkgver}.tar.gz"
        "v${pkgver}.tar.gz.sig")
sha512sums=('500e2afc8f146fb7c7af752f1d75f3c7cded7815264920de467fabb9eb21ce143da975c55c56c371605097467bec816a6b57f35bfa246e3af4faae819a1f7891'
            'SKIP')

build() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
	ls
        gcc dhcplease.c -o dhcplease
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}-${pkgver}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/README.md ${pkgdir}/usr/share/doc/${_pkgname}/README.md
}
