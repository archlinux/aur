# Maintainer: Anton Batenev <antonbatenev@yandex.ru>

pkgname=timegrep
pkgver=0.7
pkgrel=1
pkgdesc='Utility to grep log between two dates or tail last lines to time ago'
arch=('i686' 'x86_64')
url='https://github.com/abbat/timegrep'
license=('BSD')
depends=('pcre')
makedepends=('git')
source=("git+https://github.com/abbat/timegrep.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"

    install -D -m755 timegrep         "${pkgdir}/usr/bin/timegrep"
    install -D -m644 timegrep.1       "${pkgdir}/usr/share/man/man1/timegrep.1"
    install -D -m644 README.md        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
