# Maintainer: gomanager <gomanager@generated>
pkgname=go-test-report
pkgver=0.9.3
pkgrel=2
pkgdesc="Captures go test output and parses it into a single self-contained HTML file."
arch=('x86_64' 'aarch64')
url="https://github.com/vakenbolt/go-test-report"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/vakenbolt/go-test-report.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
