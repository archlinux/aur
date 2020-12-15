# I repackaged it to remove the electron since we already have the native version.
# I am not a developer, just a user who wants to share this tool.

pkgname=loki-wallet-gui
_pkgname=loki-electron-wallet
pkgver=1.5.4
pkgrel=1
pkgdesc="Loki Electron GUI Wallet"
arch=('x86_64')
url="https://github.com/loki-project/loki-electron-gui-wallet"
depends=(electron)
license=('BSD-3')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.deb" "loki-wallet-gui.desktop")

md5sums=('f4204b67c547784888e68e3e43809839'
         '8783f77ae3dd40e04b93682c07629c0e')
sha256sums=('0ff8148ee6152e18661d9fc9cbdd00ac4e9f6a7370a19d96a3d60f9e52bc806d'
            'a737badf6e01b8cf486ecc683d4fc859032260aaf79db7fb377e1787b3771250')
sha512sums=('0869ce26d85aa89e55d9abfa8bd73ec7d9b8be98e4e3671259704ddee467825e2fff369210ace69ed3959f248c5868ee4f08f88068a4a5ee1222506963fdaf67'
            '42f8c59665383ec24d637fad0932490ad944b2048fff88e9fe1e08e931c7f5ab97f60c4aa233016b193b0de00c1927dec58a102a45fea115844f5a0f464ea6c9')

package(){
  cd $srcdir
  tar xf data.tar.xz
  install -d $pkgdir/opt/$pkgname
  install -d $pkgdir/opt/$pkgname/bin

  install -Dm644 $srcdir/opt/Loki\ Electron\ Wallet/resources/app.asar $pkgdir/opt/$pkgname/app.asar
  
  install -Dm755 $srcdir/opt/Loki\ Electron\ Wallet/resources/bin/lokid $pkgdir/opt/$pkgname/bin/lokid
  install -Dm755 $srcdir/opt/Loki\ Electron\ Wallet/resources/bin/loki-wallet-rpc $pkgdir/opt/$pkgname/bin/loki-wallet-rpc
  
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 ${srcdir}/usr/share/icons/hicolor/0x0/apps/$_pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  
}
