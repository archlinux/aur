#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nautilus-nutstore
pkgver=6.3.6
pkgrel=1
pkgdesc='Nutstore integration for Nautilus'
arch=(x86_64)
url='https://www.jianguoyun.com/'
license=('CC-BY-ND-3.0 AND GPL-2.0-or-later')
depends=(libnautilus-extension nutstore)
source=('https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz')
sha256sums=('6bc613f69736839e0641815c7f2fe8b4ae26621caa58e0e693ecb3b2a7b464d9')

build() {
  cd "$srcdir/nutstore_linux_src_installer"
  ./configure || return 1
  make || return 1
}

package() {
  cd "$srcdir/nutstore_linux_src_installer"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
