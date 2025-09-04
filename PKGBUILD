# Maintainer: Hasan Catalgol <hasancatalgol at gmail.com>

pkgname=apache-gravitino
pkgver=0.9.1
pkgrel=1
pkgdesc="Apache Gravitino: a high-performance, geo-distributed, federated metadata lake"
arch=('any')
url="https://gravitino.apache.org/"
license=('Apache')
depends=('java-runtime>=11')
source=("https://dlcdn.apache.org/gravitino/${pkgver}/gravitino-${pkgver}-bin.tar.gz")
sha256sums=('69e1b1eb6fe603d96c737444687bd558fa6f33c25caf77674f80ebed915129bf')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r "gravitino-${pkgver}"/* "$pkgdir/usr/share/$pkgname/"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/bin/gravitino.sh" "$pkgdir/usr/bin/gravitino"
  ln -s "/usr/share/$pkgname/bin/gravitino-iceberg-rest-server.sh" "$pkgdir/usr/bin/gravitino-iceberg-rest-server"
}
