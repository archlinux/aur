# Maintainer: robertfoster

pkgname=nnls-chroma
pkgver=1.1
pkgrel=1
pkgdesc="NNLS Chroma/Chordino is an open source Vamp plugin library for harmony and chord extraction."
arch=(i686 x86_64)
url="https://soundsoftware.ac.uk"
license=('GPL')
groups=('pro-audio' 'vamp-plugins')
depends=('vamp-plugin-sdk')
source=("$pkgname-$pkgver.tar.gz::https://code.soundsoftware.ac.uk/hg/nnls-chroma/archive/v${pkgver}.tar.gz")
md5sums=('00bc45e52dce4a846403fe81e4f3c215')

build() {
    cd "$pkgname-v$pkgver"
    make -f Makefile.linux
}

package() {
    cd "$pkgname-v$pkgver"
    install -vDm 644 nnls-chroma.cat \
    -t "${pkgdir}/usr/lib/vamp/"
    install -vDm 644 nnls-chroma.n3 \
    -t "${pkgdir}/usr/lib/vamp/"
    install -vDm 755 nnls-chroma.so \
    -t "${pkgdir}/usr/lib/vamp/"
}
