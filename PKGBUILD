# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=ripme-bin
pkgver=1.7.92
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/RipMeApp/ripme"
license=('MIT')
depends=('java-runtime')
provides=('ripme')
conflicts=('ripme')
source=("https://github.com/RipMeApp/ripme/releases/download/$pkgver/ripme.jar")
sha256sums=('e0d946933c0a89da03e9a5a00420a87dd8c2fc23eae01e1a2fb8390eceb9b868')

package() {
  cd "$srcdir"
  install -Dm644 ripme.jar "$pkgdir/usr/share/java/ripme.jar"
  cat << EOF | install -Dm755 /dev/stdin "$pkgdir/usr/bin/ripme"
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}
