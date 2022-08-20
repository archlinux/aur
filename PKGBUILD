# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=lightproxy-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Lightweight local proxy, useful for giving your local services memorable local domain names."
arch=("x86_64")
url="https://github.com/octavore/lightproxy"
license=("MIT License")
provides=("lightproxy")
conflicts=("lightproxy" "lightproxy-git")
makedepends=("gzip")
source=("$pkgname-$pkgver.gz::$url/releases/download/v$pkgver/lightproxy_${pkgver}_linux_amd64.tar.gz")
sha256sums=('952219f72af79d0160811b360b653ab2b0e9f0dd41ad4af63153e9acea523bb7')

prepare() {
  gzip -d --force "$pkgname-$pkgver.gz"
}

package() {
  install -Dm755 "$srcdir/lightproxy" "$pkgdir/opt/lightproxy/lightproxy"
  install -d "$pkgdir/usr/bin" && ln -s "/opt/lightproxy/lightproxy" "$_/lightproxy"
}
