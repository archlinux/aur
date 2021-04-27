# Maintainer: David Birks <david@birks.dev>

pkgname=opa
pkgver=0.28.0
pkgrel=1
pkgdesc='Command-line utility and REPL for Open Policy Agent'
arch=(x86_64)
url='https://github.com/open-policy-agent/opa'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-policy-agent/opa/archive/v$pkgver.tar.gz")
sha256sums=('7d519fcb4d50fdaaaa77405987281484eebcb1ab4f433408df1d0a4a73896281')

build() {
  cd $pkgname-$pkgver

  go build \
  --trimpath \
  --ldflags "-X github.com/open-policy-agent/opa/version.Version=$pkgver" \
  -o opa \
  .
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
