# Maintainer: Mark Stenglein <aur@markstenglein.com>
name=getting-over-it-with-bennett-foddy
pkgname=$name-bin
pkgver=1.5861
pkgrel=2
pkgdesc="A game I made for a certain kind of person. To hurt them."
arch=("x86_64")
url="http://www.foddy.net/2017/09/getting-over-it/"
license=('custom:commercial')
makedepends=()
depends=('gtk2')
conflicts=("$name")
source=("local://GettingOverIt_Linux_$pkgver.zip"
        "$name.png"
        "net.foddy.GettingOverIt.desktop")
sha256sums=('bae7e7b7cb701d9204af97ecd62861a71d9af522a37fb284b220935d619722a0'
            'b58a36f3997ef487f18424c37df1cf97af73a921d9ddfba5f85417f5001c8d50'
            'a96ff6044d9fa8ed0c9511620ba575b0750b7d25bff30905e6de7e3ae1e706fb')

package() {
    mkdir -p $pkgdir/opt/$name
    cp -r GettingOverIt_Linux_$pkgver/GettingOverIt_Data $pkgdir/opt/$name/
    install -Dm755 GettingOverIt_Linux_$pkgver/GettingOverIt.x86_64 $pkgdir/opt/$name/
    install -Dm644 $name.png $pkgdir/usr/share/pixmaps/$name.png
    install -Dm644 net.foddy.GettingOverIt.desktop $pkgdir/usr/share/applications/net.foddy.GettingOverIt.desktop
}
