# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=ripme-bin
pkgver=1.7.95
pkgrel=2
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/RipMeApp/ripme"
license=('MIT')
depends=('java-runtime')
provides=('ripme')
conflicts=('ripme')
source=("ripme-$pkgver.jar::https://github.com/RipMeApp/ripme/releases/download/$pkgver/ripme.jar")
sha256sums=('008201e406f401b27248277a4188f26203bb9da0170872de900125f8a6c8b558')

package() {
  cd "$srcdir"
  install -Dm644 "ripme-$pkgver.jar" "$pkgdir/usr/share/java/ripme.jar"
  cat << EOF | install -Dm755 /dev/stdin "$pkgdir/usr/bin/ripme"
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}
