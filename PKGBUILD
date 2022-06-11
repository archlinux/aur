# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='termdbms'
pkgname="${_pkgname}-git"
pkgver=r105.be6f397
pkgrel=1
pkgdesc="A TUI for viewing and editing database files. "
arch=('x86_64' 'armv7h')
url="https://github.com/mathaou/termdbms"
license=('MIT')
makedepends=('git' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    go build
    install -Dm 755 "termdbms" "${pkgdir}/usr/bin/termdbms"
}
