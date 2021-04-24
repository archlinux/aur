# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Stefan Seemayer <mail@semicolonsoftware.de>

pkgname=jalview
pkgver=2.11.1.4
pkgrel=1
pkgdesc="Bioinformatics Multiple Alignment Editor"
arch=(any)
url="https://www.jalview.org/"
license=('GPL3')
depends=(java-runtime)
source=("http://www.jalview.org/getdown/release/install4j/1.8/jalview-2_11_1_4-unix-java_8.tar.gz"
    'jalview'
    'jalview.desktop')
noextract=("jalview-2_11_1_4-unix-java_8.tar.gz")
sha256sums=('32fa6106f3afedf7e60d4b1c8006846903e4cdaa0730190cfea399ab49202c05'
    'dbe5edfa9b17a1f85083b5aae16ef7a186a0d0035e6a81761cf73d0e1121ce58'
    'd9e0823d3b724d1c373763864d5daf6ebd59d1511347ec461310324afa45448e')

prepare() {
    mkdir -p ./$pkgname-$pkgver
    tar -xzvf *.tar.gz -C ./$pkgname-$pkgver --strip-components 1
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin/" ${pkgname}
    install -Dm644 -t $pkgdir/usr/share/applications/ jalview.desktop

    install -Dm644 -t "$pkgdir/usr/share/java/$pkgname" $srcdir/$pkgname-$pkgver/release/*.jar

    install -Dm644 $srcdir/$pkgname-$pkgver/resource/JalviewLogo_Huge.png $pkgdir/usr/share/pixmaps/jalview_logo.png
    install -Dm644 $srcdir/$pkgname-$pkgver/resource/jalview_logos.ico $pkgdir/usr/share/pixmaps/jalview_logos.ico
}
