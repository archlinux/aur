# Maintainer: syui <syui@users.noreply.github.com>
pkgname=xq
pkgver=0.3.4
pkgrel=1
pkgdesc="xml to json convert parser"
arch=('x86_64' 'i686')
url="https://github.com/syui/xq"
makedepends=('go-pie')
license=('MIT')
source=("${pkgname}-${pkgver}::${url}/archive/$pkgver.tar.gz")
sha256sums=('6dc017cf06a598f8bc781a508ff0e63bbc5d7828026b8e7733dc387aec280ceb')
build(){
  cd "${pkgname}-${pkgver}"
  go build \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}" \
    -o $pkgname .
}
package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
