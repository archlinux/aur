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
sha256sums=('d18a5ada8d7505cc084931760308a15044f1a76ae87326e986189d51f4d9694f') 

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

