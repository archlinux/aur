# Maintainer: Sougato Chakrobortty <someonesomething800@gmail.com>
pkgname=cysinfo-git
_pkgname=cysinfo
pkgver=r5.278d10a
pkgrel=1
pkgdesc="A super simple and minimal fetch tool."
arch=('any')
url="https://gitlab.com/charged1/cysinfo.git"
license=('GPL3')
depends=(bash gawk)
makedepends=(git make)
provides=(cysinfo)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
}
