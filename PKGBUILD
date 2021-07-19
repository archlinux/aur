# Maintainer: Ehsan Ghorbannezad <ehsangn at protonmail dot ch>

_pkgname='pcal-calendar'
pkgname="${_pkgname}-git"
pkgver=r12.94deca8
pkgrel=1
pkgdesc='CLI tool to convert Georgian dates to Persian dates'
arch=('any')
url='https://github.com/a5hk/pcal'
license=('MIT')
makedepends=('git')
provides=('pcal')
conflicts=('pcal')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    install -Dm755 pcal "${pkgdir}/usr/bin/pcal"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
