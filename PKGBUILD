# Maintainer: Charles Duffy <charles@dyfis.net>
pkgname=ns-exec-tools
pkgver=0.0.2
pkgrel=2
pkgdesc="Lightweight, execline-style tools to build restricted Linux namespaces"
arch=( any )
url="https://github.com/charles-dyfis-net/ns-exec-tools"
license=( ISC )
depends=( util-linux )
optdepends=( "lxc: network support" )
conflicts=( "${pkgname}-git" )
source=( "ns-exec-tools::git+https://github.com/charles-dyfis-net/ns-exec-tools#tag=$pkgver" )
sha1sums=( SKIP )

build() { :; }

package() {
  cd "${pkgname%-git}"
  mkdir -p \
    "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/bin"
  cp README.md "$pkgdir/usr/share/doc/$pkgname/"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  cp [[:lower:]]* "$pkgdir/usr/bin/"
}
