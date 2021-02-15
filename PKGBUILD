# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

_name=textnote
pkgname="${_name}-git"
pkgver=r148.2ff9307
pkgrel=1
pkgdesc='Simple tool for creating and organizing daily notes on the command line'
arch=('x86_64')
url='https://github.com/dkaslovsky/textnote'
license=('MIT')
depends=()
makedepends=('go')
conflicts=(${_name})
provides=(${_name})
source=("${pkgname}::git+https://github.com/dkaslovsky/textnote.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    go build
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "textnote" "$pkgdir/usr/bin/textnote"
}
