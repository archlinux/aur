# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=balz
pkgver=1.20
_pkgver=${pkgver//[.]/}
pkgrel=2
pkgdesc="Command-line file compressor with a high compression ratio and fast decompression"
arch=(i686 x86_64)
url=http://balz.sourceforge.net
license=('custom: Public Domain')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}${_pkgver}src.zip)
sha256sums=('d9ae8353f8c18c0f34c7bedbd4ba91ec8e63590ced179bee0767a99b4d449b26')
sha512sums=('301bc22d5c09dd9fd1eaffd62e7f06a9c993441b5d46d159765db47c6f9cabfd501e94ed4ffacb3970f1f2d4adc82192c208591075eddd473681c9d3389bb068')

build() {
    cd "$srcdir"/$pkgname/
    g++ $pkgname.cpp -o $pkgname -Wall
}

package() {
    cd "$srcdir"/$pkgname/
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 README.TXT "$pkgdir"/usr/share/doc/$pkgname/README.TXT
}
