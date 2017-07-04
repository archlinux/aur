# Maintainer chron <chron at posteo dot de>
pkgname=httpdiff
pkgver=1.0.0
pkgrel=1
pkgdesc="Perform the same request against two HTTP servers and diff the results"
arch=("i686" "x86_64")
url="https://github.com/jgrahamc/httpdiff"
license=("GPL2")
makedepends=("git" "go")
source=("httpdiff::git+https://github.com/jgrahamc/httpdiff.git#tag=v1.0.0")

sha256sums=("SKIP")

build() {
    cd ${srcdir}/${_pkgname}
    make all
}

package() {
    cd ${srcdir}/${_pkgname}
    install -Dm 755 "${srcdir}/${_pkgname}/httpdiff" "${pkgdir}/usr/bin/httpdiff"
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
