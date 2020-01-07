# Maintainer: Anton Batenev <antonbatenev@yandex.ru>

pkgname=elfexec
pkgver=0.3
pkgrel=1
pkgdesc='Utility to execute ELF binary directly from stdin pipe'
arch=('i686' 'x86_64')
url='https://github.com/abbat/elfexec'
license=('BSD')
makedepends=('git')
source=("git+https://github.com/abbat/elfexec.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"

    install -D -m755 elfexec          "${pkgdir}/usr/bin/elfexec"
    install -D -m644 elfexec.1        "${pkgdir}/usr/share/man/man1/elfexec.1"
    install -D -m644 README.md        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
