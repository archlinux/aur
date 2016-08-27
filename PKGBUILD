# Maintainer: farwayer <farwayer@gmail.com>

_filename=rn-debugger-linux-x64.zip

pkgname=react-native-debugger
pkgver=0.4.0
pkgrel=1
pkgdesc="The standalone app for React Native Debugger, with React DevTools / Redux DevTools"
arch=('x86_64')
url='https://github.com/jhen0409/react-native-debugger'
depends=()
license=('MIT')
source=(
    "$url/releases/download/v$pkgver/$_filename"
)
sha512sums=(
    '8afb18d1a0a268164e5706c936b23838bec8a009d5c62a45ed235672c369c7a6d4060f352d9fd3b0b07d0743cbb335539791b188486d666daf28b7a51b6dedbc'
)

package() {
    rm $srcdir/$_filename
    install -d $pkgdir/opt/$pkgname
    cp -r $srcdir/. $pkgdir/opt/$pkgname

    install -d $pkgdir/usr/bin
    ln -s /opt/$pkgname/React\ Native\ Debugger $pkgdir/usr/bin/react-native-debugger
    ln -s /opt/$pkgname/React\ Native\ Debugger $pkgdir/usr/bin/rn-debugger
}

