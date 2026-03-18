# Maintainer: Vee Satayamas <veerpub@pm.me>

pkgbase='fonts-arundina'
pkgname=('ttf-arundina' 'otf-arundina')
pkgver=0.4.0
pkgrel=2
pkgdesc='Thai fonts aiming at Bitstream Vera and Dejavu compatibility'
arch=('any')
license=('GPL' 'custom')
makedepends=('fontforge')
url=https://linux.thai.net/projects/fonts-sipa-arundina
source=("https://linux.thai.net/pub/thailinux/software/fonts-arundina/fonts-arundina-$pkgver.tar.xz")
md5sums=('de86bd769489e11b71324dd47272602a')

build() {
    cd fonts-arundina-$pkgver
    ./configure \
	--disable-latex \
	--disable-pfb \
	--enable-otf
    make
}

package_ttf-arundina() {
    cd fonts-arundina-$pkgver
    install -Dm644 -t "$pkgdir/usr/share/$pkgname" arundina/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}

package_otf-arundina() {
    cd fonts-arundina-$pkgver
    install -Dm644 -t "$pkgdir/usr/share/$pkgname" arundina/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
