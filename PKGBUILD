# Maintainer: Charles Vejnar <ce@vejnar.org>

pkgname=skewer
pkgver=0.2.2
pkgrel=1
pkgdesc="A fast and sensitive adapter trimmer for illumina paired-end sequences"
arch=("i686" "x86_64")
url="https://github.com/relipmoc/skewer"
license=("MIT")
source=("https://github.com/relipmoc/skewer/archive/${pkgver}.tar.gz"
        "makefile.patch")
sha1sums=("110d99ccee1e420c06b0848a9281a5b509aa32bd"
          "8041ecd529da1b6fe2233af9144e236464486c7d")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -p1 -i "${srcdir}/makefile.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 skewer "$pkgdir/usr/bin/skewer"
}
