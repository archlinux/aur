# Maintainer: justforlxz <justforlxz@gmail.com>

pkgbase=deepin-default-settings
pkgname=(deepin-font-settings)
pkgver=2020.10.21
pkgrel=2
pkgdesc="Deepin default settings"
arch=('x86_64')
url="https://github.com/linuxdeepin/default-settings"
license=('GPL3')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/linuxdeepin/default-settings/archive/$pkgver.tar.gz")
sha512sums=('520e14f647cc6f3cf5e71c97427533c27a4ae1b0658faa86e74c631e18865fb386385eb66d24d4d4a8b9e8b9726737bcf64d2fc9dfb445d8d919f20e228e7778')

build() {
  cd default-settings-$pkgver
}

package_deepin-font-settings() {
  depends=('fontconfig')

  cd default-settings-$pkgver
  mkdir -p $pkgdir/usr/share/fontconfig/conf.avail/
  cd usr.share.d/fontconfig/
  install -Dm644 conf.avail/*.conf -t $pkgdir/usr/share/fontconfig/conf.avail/
  mkdir -p $pkgdir/etc/fonts/conf.d/
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/etc/fonts/conf.d
}
