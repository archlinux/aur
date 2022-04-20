# Maintainer: Yasuaki Uechi <y@uechi.io>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='fx'
pkgver=21.0.0
pkgrel=1
pkgdesc='Terminal JSON viewer'
arch=('any')
url='https://github.com/antonmedv/fx'
license=('MIT')
makedepends=('go')
source=("https://github.com/antonmedv/fx/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cd3a34b9072e0aafd0fb362daf7400d7e1fad9ae326c85302191e9179e6be749')

build() {
  export GOPATH="$srcdir/gopath"

  cd "$srcdir/$pkgname-$pkgver"

  go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 -t "${pkgdir}/usr/bin" fx
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
