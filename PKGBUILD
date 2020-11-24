# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=ripme-bin
pkgver=1.7.94
pkgrel=2
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/RipMeApp/ripme"
license=('MIT')
depends=('java-runtime')
provides=('ripme')
conflicts=('ripme')
source=("ripme-$pkgver.jar::https://github.com/RipMeApp/ripme/releases/download/$pkgver/ripme.jar")
sha256sums=('1ebe144d0f294c4e8b482742a2588201f8b962fbcebbbd109627e1fc9e2b6d94')

package() {
  cd "$srcdir"
  install -Dm644 "ripme-$pkgver.jar" "$pkgdir/usr/share/java/ripme.jar"
  cat << EOF | install -Dm755 /dev/stdin "$pkgdir/usr/bin/ripme"
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}
