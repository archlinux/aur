# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=libweb
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple and lightweight web framework"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://gitea.privatedns.org/xavi/libweb"
license=('GPL3')
makedepends=('dynstr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-rc3.tar.gz")
sha512sums=('d7c1d05b6715d7fa903a3dc2687b82d6b99cc3a82303ca5b9d55764f16f61dc7c6af7416f09fce0cbc62bcda58ff4680e38cb6079b304c5fedc480ad1d3578ee')

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  mkdir -p "$pkgdir/usr/include"
  install -Dm644 include/libweb/* "$pkgdir/usr/include/"

  mkdir -p "$pkgdir/usr/lib"
  install -Dm755 "libweb.a" "$pkgdir/usr/lib/"

  cd "doc"

  make PREFIX="$pkgdir" install
}

