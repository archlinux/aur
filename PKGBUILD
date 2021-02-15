# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

pkgname='textnote'
pkgver=1.0.0
pkgrel=1
pkgdesc='Simple tool for creating and organizing daily notes on the command line'
arch=('x86_64')
url='https://github.com/dkaslovsky/textnote'
license=('MIT')
depends=()
makedepends=('go')
provides=("${pkgname}")
source=("https://github.com/dkaslovsky/textnote/archive/v${pkgver}.tar.gz")
sha256sums=('a59c6c1a830ea9417e118d5bd260ade24f482145b1a216a78fcfa38391b80aa6')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    go build
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "textnote" "$pkgdir/usr/bin/textnote"
}
