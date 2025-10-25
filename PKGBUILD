# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: dcraven <dcraven@gmail.com>

pkgname=bless
pkgver=0.6.3
pkgrel=2
pkgdesc="High-quality, full-featured hex editor"
arch=('any')
url="https://github.com/afrantzis/bless"
license=('GPL-2.0-only')
depends=('gtk-sharp-2')
makedepends=('meson' 'ninja' 'itstool')
source=($pkgname.tar.gz::https://github.com/afrantzis/bless/archive/v0.6.3.tar.gz)
sha256sums=('547f2f28073fc791c9d52fa5fd7d66d92c42c7d7fecba05ce1e4b55278ff8cd4')

build() {
  cd "$pkgname-$pkgver"

  arch-meson -Dtests=false -Dhtml_user_doc=false build

  ninja -C build
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" ninja -C build install
}
