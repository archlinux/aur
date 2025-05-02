# Contributor: bender02 at archlinux dot us
pkgname=gkrellm-wifi
pkgver=0.9.12
pkgrel=3
pkgdesc="A GKrellM2 plug-in for monitoring the link quality of your wireless LAN cards"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('gkrellm')
url="https://github.com/tecknicaltom/gkrellm-wifi"
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('6f05bcc0d73752a9977d135c0f441cc6e5dc1a40fef242d874f3e66b66017e6c')

build() {
  cd $srcdir/$pkgname-$pkgver
  CFLAGS+=' -std=gnu17 -Wno-error=incompatible-pointer-types ' make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 gkrellm-wifi.so $pkgdir/usr/lib/gkrellm2/plugins/gkrellm-wifi.so
}

# vim: ts=2: ft=sh
