# Maintainer: afontenot <adam.m.fontenot@gmail.com>

pkgname="logic2010"
pkgver="20180112"
pkgrel="5"
pkgdesc="Educational symbolic logic software provided for free by UCLA"
arch=('any')
url="https://logiclx.humnet.ucla.edu"
license=('custom')
depends=('java-runtime')
source=("$url/auto_remote/desktop/$pkgver/Logic2010_mac_$pkgver.zip"
        "LICENSE"
        "logic2010.sh"
        "logic2010.desktop")
sha256sums=('7482fae836e2d83d87bf381774bef8a4fbd9929da0ae20482db98c86a755c9ed'
            'a8e232f0e92a6443765a1649a7e1400efc06f7d81fe1420a85ba781a97dbbdc7'
            'c96d47ca05518bd843318629cb3cd584c380129c2cdefc7ae2c63b3165ddcc22'
            '622c3912d99b188843fdc6f303f8dd6a7475f7c7b291ae4ab6f26b4fd4a76993')

package() {
    cd "$srcdir"

    install -Dm 644 "Contents/Java/logic.jar" "$pkgdir/opt/$pkgname/logic.jar"
    cp -r --no-preserve=all Contents/Resources/* "$pkgdir/opt/$pkgname/"

    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    install -Dm 755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
   
    install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    bsdtar -xqf "Contents/Java/logic.jar" "images/Logic2010_256.png"
    install -Dm 644 "images/Logic2010_256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
