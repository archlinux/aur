# Maintainer: Daniel Lublin <daniel@lublin.se>

pkgname=i3gopher
pkgver=0.1.1
pkgrel=1
pkgdesc='i3 wm helper rodent - focus last focused window per workspace'
arch=('x86_64')
url="https://github.com/quite/i3gopher"
license=('BSD')
makedepends=('go-pie')
source=("$url/archive/v0.1.1.tar.gz")
sha256sums=('4dded0045654cb540cc9ca79cc396c503cfa0d4c6bab52e33b869532ce2094a8')

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
