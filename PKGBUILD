# Maintainer: Lyam Zambaz <lyam dot zambaz at gmail dot com>

pkgname=oports-git
_pkgname=oports
pkgdesc="A wrapper around 'ss -tunlp' to display cleaner output"
pkgver=r7.f891e4c
pkgrel=1
arch=('any')
url="https://github.com/sdushantha/oports"
license=('MIT')
provides=('oports')
conflicts=('oports')
depends=('iproute2')
makedepends=('git')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

source=(
    "$_pkgname::git+https://github.com/sdushantha/oports#branch=master"
)

sha256sums=('SKIP')

package() {
    cd "${_pkgname}"
    install -Dm0755 oports "${pkgdir}/usr/bin/oports"
}
