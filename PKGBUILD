# Maintainer: robiot <me@robiot.dev>

pkgname=rustcat
_binname=rcat
pkgver=3.0.0
pkgrel=1
pkgdesc='A Modern Port Listener & Reverse Shell.'
arch=('x86_64')
url='https://github.com/robiot/rustcat'
license=('GPL-3.0')
makedepends=('cargo' 'git')
sha512sums=('SKIP')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver

  cargo build --release
}

package() {
  cd $pkgname-$pkgver

  install -Dm 755 "target/release/$_binname" "$pkgdir/usr/bin/$_binname"
}