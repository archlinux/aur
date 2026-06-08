# Maintainer: Karol Jarząbek <kar.jarzabek@gmail.com>
pkgname=morfeusz2-bin
pkgdesc="Morphological analyser Morfeusz, binary version"
arch=('x86_64')
url="http://morfeusz.sgjp.pl/"
license=('BSD')

pkgver=1.99.15
_pkgdate=20260607
pkgrel=1
epoch=0
options=('!strip')

depends=('glibc')
makedepends=()

source_x86_64=("https://download.sgjp.pl/morfeusz/${_pkgdate}/Linux/manylinux_2_28/64/morfeusz2-${pkgver}.sgjp.${_pkgdate}-Linux-amd64.tar.gz")
sha256sums_x86_64=('ff295460f1ae79b36fbed7032cfbf8e20c13738095b4575b6d3a763132404279')

package() {
    cd "${srcdir}/morfeusz2-${pkgver}.sgjp.${_pkgdate}-Linux-amd64/"
    install -Dm 755 bin/*     -t "${pkgdir}/usr/bin/"
    install -Dm 755 include/* -t "${pkgdir}/usr/include/"
    install -Dm 755 lib/*     -t "${pkgdir}/usr/lib/"
}
