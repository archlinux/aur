# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=lightproxy-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Lightweight local proxy, useful for giving your local services memorable local domain names."
arch=("x86_64")
url="https://github.com/octavore/lightproxy"
license=("MIT License")
provides=("lightproxy")
conflicts=("lightproxy" "lightproxy-git")
source=("$pkgname-$pkgver.gz::$url/releases/download/v$pkgver/lightproxy_${pkgver}_linux_amd64.tar.gz")
sha256sums=("00480fcc99f018c0e76fc5021a67144767688267705f0ae5d23fe00828c33191")

prepare() {
  gzip -d --force "$pkgname-$pkgver.gz"
}

package() {
  install -Dm755 "$srcdir/lightproxy" "$pkgdir/opt/lightproxy/lightproxy"
  install -d "$pkgdir/usr/bin" && ln -s "/opt/lightproxy/lightproxy" "$_/lightproxy"
}
