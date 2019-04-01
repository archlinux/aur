# Maintainer: Haruue Icymoon <haruue@caoyue.com.cn>

pkgname=ncmdump-go
_basename="${pkgname%-go}"
pkgver=0.2.0
pkgrel=1
pkgdesc='netease cloud music copyright protection file dump, go port'
arch=('i686' 'x86_64')
url='https://github.com/yoki123/ncmdump'
conflicts=("$_basename")
provides=("$_basename")
license=('unknown')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/yoki123/ncmdump/archive/v$pkgver.tar.gz")
md5sums=('e2cdf69603994c9d8424ae7a67265540')

build() {
  export GOPATH="$srcdir/gopath"
  mkdir -p "$GOPATH"
  cd "$srcdir/$_basename-$pkgver"
  go get ./...
  go build
}

package() {
  install -Dm755 "$srcdir/$_basename-$pkgver/$_basename" "$pkgdir/usr/bin/$_basename"
}

# vim:set ts=8 sts=2 sw=2 et:
