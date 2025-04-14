# Maintainer: Sougato Chakrobortty <someonesomething800@gmail.com>
pkgname=cysinfo-git
_pkgname=cysinfo
pkgver=3.0
pkgrel=3
pkgdesc="A super simple and minimal fetch tool."
arch=('any')
url="https://codeberg.org/Charged/cysinfo.git"
license=('GPL3')
depends=(bash gawk wmctrl)
makedepends=(git make)
provides=(cysinfo)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "3.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
}
