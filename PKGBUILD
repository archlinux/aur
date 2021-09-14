# Maintainer: Daniel Lublin <daniel@lublin.se>

pkgname=i3gopher
pkgver=1.1.0
pkgrel=1
pkgdesc='i3 wm helper rodent - focus last focused window per workspace'
arch=('x86_64')
url="https://github.com/quite/i3gopher"
license=('BSD')
makedepends=('go-pie')
source=("$url/archive/v1.1.0.tar.gz")
sha256sums=('ad96d82d8def1666340f4ee4b915403f04f5750c7ce25c04aab9ef1733539c6a')

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
