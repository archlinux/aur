# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

pkgname='textnote'
pkgver=1.1.0
pkgrel=1
pkgdesc='Simple tool for creating and organizing daily notes on the command line'
arch=('x86_64')
url='https://github.com/dkaslovsky/textnote'
license=('MIT')
depends=()
makedepends=('go')
provides=("${pkgname}")
source=("https://github.com/dkaslovsky/textnote/archive/v${pkgver}.tar.gz")
sha256sums=('cbccbddecb93b5e831446a1afa998f553ce339bd26864a727d41e6ab1f924e77')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    go build
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "textnote" "$pkgdir/usr/bin/textnote"
}
