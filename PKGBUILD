# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

pkgname='textnote'
pkgver=1.1.1
pkgrel=1
pkgdesc='Simple tool for creating and organizing daily notes on the command line'
arch=('x86_64')
url='https://github.com/dkaslovsky/textnote'
license=('MIT')
depends=()
makedepends=('go')
provides=("${pkgname}")
source=("https://github.com/dkaslovsky/textnote/archive/v${pkgver}.tar.gz")
sha256sums=('29bd17095654bc176a39ab3bb0e3a4cca84eea22783dcbafbac8c49fe9e90808')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    go build
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "textnote" "$pkgdir/usr/bin/textnote"
}
