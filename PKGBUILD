# Maintainer: Arnaud Rebillout <arnaud.rebillout@collabora.com>

pkgname=libnss-unknown
pkgver=0.0.2
pkgrel=1
pkgdesc='nss module to gracefully handle unknown uids'
arch=(x86_64)
url='https://gitlab.collabora.com/sjoerd/libnss-unknown'
license=('LGPL2.1')
makedepends=(meson)
install=libnss-unknown.install
source=($pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
md5sums=('cec375568f5843281702b5a392ad7432')

build() {
  arch-meson "$pkgname-v$pkgver" build
  ninja -C build
}

check() {
  # requires sharness, nss_wrapper
  #meson test -C build
  true
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
