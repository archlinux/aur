# Maintainer: Nero Blackstone <gf7600gs@gmail.com>

pkgname=numaplayer
pkgver=2.1.4
pkgrel=1
pkgdesc="Set your music and inspiration totally free."
arch=('x86_64')
url="https://www.studiologic-music.com/products/numaplayer"
license=('custom:proprietary')
source=("https://www.studiologic-music.com/support/numaplayer/NumaPlayer_${pkgver}.deb")
sha256sums=('3134870b8d29212d3b76eb1370dc4bd3c933e0d4cce54d7f49d83561fa216fe5')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    ar x "$srcdir/NumaPlayer_${pkgver}.deb"
    tar --use-compress-program=unzstd -xvf data.tar.zst
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    install -dm755 "$pkgdir/usr/bin"
    cp -r usr/bin/* "$pkgdir/usr/bin/"
    
    install -dm755 "$pkgdir/usr/share"
    cp -r usr/share/* "$pkgdir/usr/share/"
    
    install -dm755 "$pkgdir/usr/lib"
    cp -r usr/lib/* "$pkgdir/usr/lib/"
}
