# Maintainer: Eren Dağlayan <erendaglayan1223@gmail.com>
pkgname=debtap-gui-gtk
pkgver=1.1.0
pkgrel=1
pkgdesc="A modern GTK4/Libadwaita GUI for debtap with desktop entry."
arch=('any')
url="https://github.com/ErenDaglayan/debtap-gui-gtk"
license=('GPL')
depends=('debtap' 'python' 'python-gobject' 'libadwaita')
# Buraya yeni dosyaları ekledik
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "debtap-gui-gtk.desktop"
        "debtap-gui-gtk.png")
# Bu sha256sums kısmını terminalde 'updpkgsums' yazarak güncelleyeceğiz
sha256sums=('1b895eca3f6592cc5d18299fe89e0231a18e78e98571ac43566bc898157540a4'
            '7e906c3bd1dc700dd021e0a7039922ff277bc631c48483dd4275a907c3f5cd34'
            'f6566ca6d8092a63c2a600a629f3a6636a4fba9c006395a77cd20551d956152e')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # 1. Ana Python dosyasını kur
  install -Dm755 debtap-gui-gtk.py "$pkgdir/usr/bin/debtap-gui-gtk"

  # 2. .desktop dosyasını (menü girişi) kur
  install -Dm644 "$srcdir/debtap-gui-gtk.desktop" "$pkgdir/usr/share/applications/debtap-gui-gtk.desktop"

  # 3. İkonu kur
  install -Dm644 "$srcdir/debtap-gui-gtk.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/debtap-gui-gtk.png"
}
