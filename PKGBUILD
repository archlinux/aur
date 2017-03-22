# Maintainer: farwayer <farwayer@gmail.com>

_filename=rn-debugger-linux-x64.zip

pkgname=react-native-debugger
pkgver=0.6.2
pkgrel=2
pkgdesc="The standalone app for React Native Debugger, with React DevTools / Redux DevTools"
arch=('x86_64')
url='https://github.com/jhen0409/react-native-debugger'
depends=(
  gtk2
  gconf
  libxss
  nss
  gcc-libs
  alsa-lib
  libxtst
)
license=('MIT')
source=(
    "$url/releases/download/v$pkgver/$_filename"
    "$pkgname.desktop"
    "icon.png"
)
sha512sums=(
    'bad41cadb852daabe44e268c31d8b9a8ec31b83be0997d92b9ffe9d954390965aa3a187ea55efa6b3ac291d64cf9f595b3b9d8a48354d35d6868a90444888b28'
    '146025ecc9ba34a22fba6576b74a042194bdf85357740da574a6aa7f6af657fba95a41e58e84684528c90154ade1eb461621b8a94600908aa254eebf4bf787ab'
    '1b6ad27debf69a041203c9583ad17d4aef71ceaa7d63d74a053d5d9c389d75e8dd5eee99ff66cbc78baf6c1fdd69a40b7ecdb44beac0c182f4c5b4b502816d3b'
)

package() {
    install -d $pkgdir/opt/$pkgname

    install -d $pkgdir/usr/bin
    ln -s /opt/$pkgname/React\ Native\ Debugger $pkgdir/usr/bin/react-native-debugger
    ln -s /opt/$pkgname/React\ Native\ Debugger $pkgdir/usr/bin/rn-debugger

    install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -m644 $srcdir/icon.png $pkgdir/opt/$pkgname/
    
    rm $srcdir/$_filename
    rm $srcdir/$pkgname.desktop
    rm $srcdir/icon.png

    cp -r $srcdir/. $pkgdir/opt/$pkgname
}

