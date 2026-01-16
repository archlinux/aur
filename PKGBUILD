# Maintainer: iiTzDante <https://github.com/iiTzDante>
pkgname=goviz
pkgver=1.0.1
pkgrel=1
pkgdesc="A real-time terminal-based audio visualizer written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/iiTzDante/goviz"
license=('MIT')
depends=('alsa-lib')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7d2a7af72b610797ab26e68b608c9e75fa9a8f868dc05977642a58467b016f09')

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go build -trimpath -buildmode=pie -mod=readonly -modcacherw -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
