# Maintainer:  <aaron.l.france@gmail.com>
pkgname=xadrian
pkgver=1.5.1
pkgrel=1
pkgdesc="Xadrian is a factory complex calculator for the games X³: Terran Conflict and X³: Albion Prelude. With this tool you can plan your factory complexes before you build them in-game."
arch=('i686' 'x86_64')
url="http://kayahr.github.io/xadrian/"
license=('GPL')
depends=('java-runtime')
provides=(xadrian)
source=(http://nexus.ailis.de/content/repositories/releases/de/ailis/$pkgname/$pkgname//$pkgver/$pkgname-$pkgver-unix.tar.bz2)
md5sums=('6885ca2822f51ca3af133d79798a69a8')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/java/xadrian"
  cp lib/*.jar "$pkgdir/usr/share/java/xadrian"
  mkdir -p "$pkgdir/usr/bin/"
  cat > "$pkgdir/usr/bin/xadrian" <<EOF
#!/bin/sh
exec java -jar "/usr/share/java/xadrian/xadrian.jar" "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/xadrian"
}

# vim:set ts=2 sw=2 et:
