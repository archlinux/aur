# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=go2tv
_name=Go2TV
pkgver=1.2
pkgrel=1
pkgdesc='cast your videos to UPnP/DLNA MediaRenderer'
arch=('x86_64')
url="https://github.com/alexballas/Go2TV"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd $_name-$pkgver
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  install -Dm755 $_name-$pkgver/$pkgname "$pkgdir"/usr/bin/$pkgname
}

sha256sums=('3822dc68374a2dcd81d865fc51c85d95d8e7ee90bcd67d88ba904e9570827ec6')
