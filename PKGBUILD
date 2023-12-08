# Maintainer: gandalf3 <zzyxpaw (at) gmail dot com>
# Contributor: Sammy Fischer <sammy.fischer@gmail.com>

pkgname=neotextureedit
pkgver=0.6.4
pkgrel=1
pkgdesc="easy to use graph-based procedural seamless texture editor" 
arch=(any)
url="http://neotextureedit.sourceforge.net/index.html" 
license=('GPL') 
depends=('java-runtime') 
makedepends=()
optdepends=()
backup=()
source=('https://downloads.sourceforge.net/project/neotextureedit/0.6/0.6.4/NeoTextureEdit_0.6.4.tar.gz' 'neotextureedit.desktop' 'neotextureedit' 'neotextureedit.png')
md5sums=('fca10a15260f8435291353cc77a92a11' 'd8f09181b3f103b3b3693cad827d11ff' '328343739771327d9c58069702aa3518' '7503e1364f05a7c8cc6ee63b8a3c0826')

package() {
  cd "$srcdir/NeoTextureEdit_$pkgver/"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 COPYING.LESSER "$pkgdir/usr/share/licenses/$pkgname/COPYING.LESSER"
  cd "$srcdir"
  install -D neotextureedit "$pkgdir/usr/bin/neotextureedit"
  install -D neotextureedit.desktop "$pkgdir/usr/share/applications/neotextureedit.desktop"
  install -D neotextureedit.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/neotextureedit.png"
  mkdir -p "$pkgdir/usr/share/java/$pkgname"
  chmod -R 755 NeoTextureEdit_$pkgver
  cp -ra "NeoTextureEdit_$pkgver" "$pkgdir/usr/share/java/"
  cd "$pkgdir/usr/share/java/NeoTextureEdit_$pkgver"
  chmod +x NeoTextureEdit.sh
  cd "$pkgdir/usr/share/java/"
  mv "NeoTextureEdit_$pkgver" "$pkgname"
}
