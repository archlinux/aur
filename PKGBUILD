# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>
pkgname=poweralertd
pkgver=0.2.0
pkgrel=2
pkgdesc="UPower-powered power alerter"
arch=('x86_64')
url="https://sr.ht/~kennylevinsen/poweralertd"
license=('GPL3')
depends=('systemd-libs' 'upower')
makedepends=('meson' 'scdoc')
optdepends=('mako: option for notification daemon'
            'libnotify: option for notification daemon')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kennylevinsen/poweralertd/archive/$pkgver.tar.gz")
sha256sums=('f70076dad452c592e2fcdeba4fd533c11394c254f42c21522aa7b56f92a0bd69')

build () {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package () {
  meson install -C build --destdir "$pkgdir"
}

