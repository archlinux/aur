# I repackaged it to remove the electron since we already have the native version.
# I am not a developer, just a user who wants to share this tool.

pkgname=loki-wallet-gui
_pkgname=oxen-electron-wallet
pkgver=1.5.6
pkgrel=1
pkgdesc="Loki Electron GUI Wallet"
arch=('x86_64')
url="https://github.com/loki-project/loki-electron-gui-wallet"
provides=("$pkgname" "$_pkgname")
depends=(electron)
license=('BSD-3')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.deb" "loki-wallet-gui.desktop")

md5sums=('43033a5e06dfec4a49ff358674cc6706'
         '8783f77ae3dd40e04b93682c07629c0e')
sha256sums=('c31d20bd36030dda3d9d3f725db7874825ae08eaf7bc83cb3d465a8f381ede66'
            'a737badf6e01b8cf486ecc683d4fc859032260aaf79db7fb377e1787b3771250')
sha512sums=('de47076c67b56937b1971fbd89eabab19a575029cbb36add9ed4eecf62a657815b3b95fba18a13396d25b296bc321b33f2ebd97fe6776658f999b4e4f345f884'
            '42f8c59665383ec24d637fad0932490ad944b2048fff88e9fe1e08e931c7f5ab97f60c4aa233016b193b0de00c1927dec58a102a45fea115844f5a0f464ea6c9')

package(){
  cd $srcdir
  tar xf data.tar.xz
  install -d $pkgdir/opt/$pkgname
  install -d $pkgdir/opt/$pkgname/bin

  install -Dm644 $srcdir/opt/Oxen\ Electron\ Wallet/resources/app.asar $pkgdir/opt/$pkgname/app.asar
  
  install -Dm755 $srcdir/opt/Oxen\ Electron\ Wallet/resources/bin/oxend $pkgdir/opt/$pkgname/bin/oxend
  install -Dm755 $srcdir/opt/Oxen\ Electron\ Wallet/resources/bin/oxen-wallet-rpc $pkgdir/opt/$pkgname/bin/oxen-wallet-rpc
  
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 ${srcdir}/usr/share/icons/hicolor/512x512/apps/$_pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png

  
}
