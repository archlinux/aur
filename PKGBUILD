# maintainer: asitos @ https://github.com/asitos
# PKGBUILD
pkgname=haj
pkgver=0.2.2
pkgrel=1
pkgdesc="fast, quiet, beautiful package management for blahArch Linux"
arch=('x86_64')
url="https://github.com/asitos/haj"
license=('MIT')
depends=('pacman' 'libalpm.so' 'display3d')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aaf261c5a6d2e8c91162145dfe46e4b9bd80cae7a150b9e869fbc190eaf42784')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release 
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/haj" "$pkgdir/usr/bin/haj"
}
