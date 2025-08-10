# Maintainer: rcrpt <jrafa1673tena@gmail.com>
pkgname=sysdmon
pkgver=1
pkgrel=1
pkgdesc="A system tool for monitoring and alerting you, if there is anything wrong with system logs."
arch=('x86_64')
url="https://github.com/RafCodes-del/sysdmon"
license=('GPL3')
depends=('libsystemd' 'libnotify' 'glib2')
source=("sysdmon-$pkgver.tar.gz::https://github.com/RafCodes-del/sysdmon/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e003894620ba9c255c04148090df9b433390163f8413a878ede0ff8ff69757b') 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  g++ ../src/sysdmon.cpp -o sysdmon `pkg-config --cflags --libs libsystemd libnotify glib-2.0`
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  install -Dm755 sysdmon "$pkgdir/usr/bin/sysdmon"
}

