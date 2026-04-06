# Maintainer: szczur4 <rybaglut1@gmail.com>
pkgname=szczur4-minesweeper
pkgver=v3.0r
pkgrel=1
pkgdesc='Infinite multiplayer minesweeper game'
arch=(any)
url='https://github.com/szczur4/szczur4-Minesweeper'
license=('unknown')
depends=('java-runtime>=25')
makedepends=()
source=("$pkgname-$pkgver.jar::https://github.com/szczur4/szczur4-Minesweeper/releases/download/$pkgver/szczur4.Minesweeper.$pkgver.jar")
sha256sums=('a4a02ad2c42092fe59c83d650ab6b6260f1121d68bdc337558cde2f992e22b66')
package(){
  install -d "$pkgdir/usr/share/java/$pkgname"
  install -dm777 "$pkgdir/var/lib/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
cd /var/lib/$pkgname
exec java -jar /usr/share/java/$pkgname/$pkgname.jar "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"
}