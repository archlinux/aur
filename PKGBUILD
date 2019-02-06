# Maintainer: Daniel Lublin <daniel@lublin.se>

pkgname=i3gopher
pkgver=0.1.0
pkgrel=1
pkgdesc='i3 wm helper rodent - focus last focused window per workspace'
arch=('x86_64')
url="https://github.com/quite/i3gopher"
license=('BSD')
makedepends=('go-pie')
source=("$url/archive/v0.1.0.tar.gz")
sha256sums=('4fc8c173c7ad63cb20d036403e275682daebd5553b33b9c5f7bc58363da6125f')

build() {
  cd $pkgname-$pkgver
  go build \
     -gcflags "all=-trimpath=$PWD" \
     -asmflags "all=-trimpath=$PWD" \
     -ldflags "-extldflags $LDFLAGS" \
     -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
