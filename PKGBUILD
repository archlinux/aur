# Maintainer: TingPing <tingping@tingping.se>

pkgname=hexchat-theme-manager
pkgver=2.9.5
pkgrel=1
pkgdesc="A simple application to manage HexChat themes"
arch=('i686' 'x86_64')
url='http://www.hexchat.org/'
license=('GPL')
depends=('mono' 'hexchat')
makedepends=('monodevelop')
optdepends=()
options=()
install='htm.install'
source=("http://dl.hexchat.net/hexchat/hexchat-$pkgver.tar.xz"
        'htm.desktop' 'htm-mime.xml')
sha256sums=('11dfd0fbfb88d8dbb38f631fab8a7dffbb179f7f7dafe316953ed6f513ac623d'
            '1de36ac0a1fb72cef845e555635f221e72130c4afe7e3fe1c326cc0872f61c8d'
            '54e4a4ed2472e2ccf34df7a2f3c8f1aca0b2b4f68687969672c9e70a1e3cbef5')

build() {
  cd "$srcdir/hexchat-$pkgver/src/htm"
  mdtool build htm-mono.csproj
}

package() {
  cd "$srcdir/hexchat-$pkgver/src/htm"
  install -D thememan.exe "$pkgdir/usr/bin/thememan"
  install -D "$srcdir/htm.desktop" "$pkgdir/usr/share/applications/htm.desktop"
  install -D "$srcdir/htm-mime.xml" "$pkgdir/usr/share/mime/packages/htm.xml"
}

