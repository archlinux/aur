# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=ripme-bin
pkgver=2.1.3
_pkgver=2.1.2-23-e5438e85
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime=>11')
provides=('ripme')
conflicts=('ripme')
source=("https://github.com/ripmeapp2/ripme/releases/download/$pkgver/ripme-$_pkgver.jar")
sha256sums=('a2309ba7ec0ffe2abca4932bd1b291cf88d0e495c233b888aa8f42c459da2ee0')

package() {
  cd "$srcdir"
  install -Dm644 "ripme-$_pkgver.jar" "$pkgdir/usr/share/java/ripme.jar"
  cat <<EOF | install -Dm755 /dev/stdin "$pkgdir/usr/bin/ripme"
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}
