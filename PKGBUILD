# Maintainer: S1LV3R <me@s1lv3r.codes>
pkgname=tsui
pkgver=0.2.0
pkgrel=1
pkgdesc='An (experimental) elegant TUI for configuring tailscale'
url='https://github.com/neuralink/tsui'
source=("$pkgname-$pkgver.tar.gz::https://github.com/neuralink/tsui/archive/v$pkgver.tar.gz")
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
optdepends=('libx11: for clipboard support')
sha256sums=('1ae87ad281587efbf80ef0bf9cc0b519dd4f08465cb378e34e97230f2f3526f0')

prepare() {
  cd "$pkgname-$pkgver"

  go get
}

build () {
  cd "$srcdir/$pkgname-$pkgver"
  go build .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 tsui "${pkgdir}/usr/bin/tsui"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
