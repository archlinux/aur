# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Frederik Schwan <freswa at archlinux dot org>

pkgname=libimobiledevice-glue
pkgver=1.1.0
pkgrel=1
pkgdesc='Library with common code used by the libraries and tools around the libimobiledevice project'
arch=('x86_64')
url='https://libimobiledevice.org/'
license=('LGPL-2.1-or-later')
depends=('libplist')
source=("https://github.com/libimobiledevice/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('e7f93c1e6ceacf617ed78bdca92749d15a9dac72443ccb62eb59e4d606d87737')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
