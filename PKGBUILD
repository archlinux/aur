# Maintainer: Caio Novais <caionov08 at gmail dot com>
pkgname=whatsapp-for-linux
pkgver=1.0.6
pkgrel=1
pkgdesc="An unofficial WhatsApp linux client desktop application."
arch=('x86_64')
url="https://github.com/eneshecan/$pkgname/releases"
license=('GPL')
depends=('gtkmm3' 'webkit2gtk')
makedepends=('cmake')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/eneshecan/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('b77d554cea71293ffebcca0e99d5cdcf')

build() {
  cd $pkgname-$pkgver
  mkdir -p build/debug && cd build/debug
  cmake -DCMAKE_BUILD_TYPE=Debug ../..
  make
}

package() {
  mkdir -p ../pkg/$pkgname/usr/bin
  install -Dm755 $pkgname-$pkgver/build/debug/$pkgname ../pkg/$pkgname/usr/bin
}
