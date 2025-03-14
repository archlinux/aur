# Maintainer: Bagić Jure <jurebagic99@gmail.com>
pkgname='ashe'
pkgver=r105.875c025
pkgrel=1
pkgdesc="UNIX toy shell."
arch=("x86_64")
url="https://github.com/b-jure/ashe"
license=("GPL-3.0-or-later")
depends=("glibc")
makedepends=("git")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    make clean
    make
}

package() {
    cd "${pkgname}"
    install -Dm755 ashe "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
