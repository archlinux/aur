# Maintainer: David Birks <david@birks.dev>

pkgname=conftest
pkgver=0.20.0
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/open-policy-agent/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-policy-agent/conftest/archive/v$pkgver.tar.gz")
sha512sums=('bf7d0933c21c3336ec3cd6c7354157d75f86bb9b37e871b9fac77271fbad8dff2b3082713b17fcacd4ad57350178ebd4830b651d09763c155285e7cbfb2625d6')

build() {
  cd $pkgname-$pkgver

  go build \
  --trimpath \
  --ldflags "-X github.com/open-policy-agent/conftest/internal/commands.version=$pkgver" \
  -o conftest \
  .
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
