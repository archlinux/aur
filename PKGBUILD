# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=ripme-bin
pkgver=1.7.93
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/RipMeApp/ripme"
license=('MIT')
depends=('java-runtime')
provides=('ripme')
conflicts=('ripme')
source=("https://github.com/RipMeApp/ripme/releases/download/$pkgver/ripme.jar")
sha256sums=('357639535c112ca857117151321141cb08ad313021079d522c2c5d15ee799998')

package() {
  cd "$srcdir"
  install -Dm644 ripme.jar "$pkgdir/usr/share/java/ripme.jar"
  cat << EOF | install -Dm755 /dev/stdin "$pkgdir/usr/bin/ripme"
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}
