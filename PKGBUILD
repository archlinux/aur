# Maintainer: justforlxz <justforlxz@gmail.com>

pkgbase=deepin-default-settings
pkgname=(deepin-font-settings)
pkgver=2020.09.11
pkgrel=1
pkgdesc="Deepin default settings"
arch=('x86_64')
url="https://github.com/linuxdeepin/default-settings"
license=('GPL3')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/linuxdeepin/default-settings/archive/$pkgver.tar.gz")
sha512sums=('6a383d3da3d59771188e2696465c3ab2ae2f3387fb24d7113b2be8d3968ce3093a1ab1e136ae8f065c99db4b504bc8dad2204496271c89277ff7b942b9e91273')

build() {
  cd default-settings-$pkgver
}

package_deepin-font-settings() {
  depends=('fontconfig')

  cd default-settings-$pkgver
  for i in `ls $(DESTDIR)/usr/share/fontconfig/conf.avail/ | grep .conf$$`;do \
    ln -sf /usr/share/fontconfig/conf.avail/$${i} $(DESTDIR)/etc/fonts/conf.d/$${i}; \
  done
}
