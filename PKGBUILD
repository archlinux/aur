# Maintainer: Mark Stenglein <aur@markstenglein.com>
_name=getting-over-it-with-bennett-foddy
pkgname=$_name-bin
pkgver=1.6
pkgrel=1
pkgdesc="A game I made for a certain kind of person. To hurt them."
arch=("x86_64")
url="http://www.foddy.net/2017/09/getting-over-it/"
license=('custom:commercial')
makedepends=()
depends=('gtk3')
conflicts=("$_name")
source=("local://gettingoveritwithbennettfoddy_linux.zip"
        "$_name.png"
        "net.foddy.GettingOverIt.desktop")
sha256sums=('3997b969a753acd8f241d0f98722705daca502cc58c927b0660eb10c0ea8bdff'
            'b58a36f3997ef487f18424c37df1cf97af73a921d9ddfba5f85417f5001c8d50'
            'a96ff6044d9fa8ed0c9511620ba575b0750b7d25bff30905e6de7e3ae1e706fb')
package() {
    mkdir -p $pkgdir/opt/$_name
    cp -r GettingOverIt/GettingOverIt_Data $pkgdir/opt/$_name/
    install -Dm755 GettingOverIt/GettingOverIt.x86_64 $pkgdir/opt/$_name/
    install -Dm644 GettingOverIt/UnityPlayer.so $pkgdir/opt/$_name/
    install -Dm644 GettingOverIt/GameAssembly.so $pkgdir/opt/$_name/
    install -Dm644 $_name.png $pkgdir/usr/share/pixmaps/$_name.png
    install -Dm644 net.foddy.GettingOverIt.desktop $pkgdir/usr/share/applications/net.foddy.GettingOverIt.desktop
}

