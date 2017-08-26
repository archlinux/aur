# Maintainer: farwayer <farwayer@gmail.com>

_filename=rn-debugger-linux-x64.zip

pkgname=react-native-debugger
pkgver=0.7.6
pkgrel=1
pkgdesc="The standalone app for React Native Debugger, with React DevTools / Redux DevTools"
arch=('x86_64')
url='https://github.com/jhen0409/react-native-debugger'
depends=(
  gtk2
  gconf
  libxss
  nss
  alsa-lib
  libxtst
)
license=('MIT')
source=(
    "$pkgver-$_filename::$url/releases/download/v$pkgver/$_filename"
    "$pkgname.desktop"
    "icon.png"
)
sha512sums=('648887a31dd731d539559f625a7b0a7a0400b12e3e4ca9c56e4a2fcb7ea97e5d964b118d5e9cdd203892ed34bc9477f74fc17a20ae0a67d80304a3120cb64d08'
            '146025ecc9ba34a22fba6576b74a042194bdf85357740da574a6aa7f6af657fba95a41e58e84684528c90154ade1eb461621b8a94600908aa254eebf4bf787ab'
            '1b6ad27debf69a041203c9583ad17d4aef71ceaa7d63d74a053d5d9c389d75e8dd5eee99ff66cbc78baf6c1fdd69a40b7ecdb44beac0c182f4c5b4b502816d3b')

package() {
    install -d $pkgdir/opt/$pkgname

    install -d $pkgdir/usr/bin
    ln -s /opt/$pkgname/React\ Native\ Debugger $pkgdir/usr/bin/react-native-debugger
    ln -s /opt/$pkgname/React\ Native\ Debugger $pkgdir/usr/bin/rn-debugger

    install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -m644 $srcdir/icon.png $pkgdir/opt/$pkgname/
    
    rm $srcdir/$pkgver-$_filename
    rm $srcdir/$pkgname.desktop
    rm $srcdir/icon.png

    cp -r $srcdir/. $pkgdir/opt/$pkgname
}

