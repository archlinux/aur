# Maintainer: Eren Dağlayan <erendaglayan1223@gmail.com>
pkgname=debtap-gui-gtk
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern GTK4/Libadwaita GUI for debtap to convert .deb packages into Arch Linux packages."
arch=('any')
url="https://github.com/ErenDaglayan/debtap-gui-gtk"
license=('GPL')
depends=('debtap' 'python' 'python-gobject' 'libadwaita')

# GitHub linki
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36d907f76a2d6b3e697d46edb59b05e94d995d2930a5b731b0172e1201d44896')

package() {
  # ls src/ çıktısına göre klasör ismi başında 'v' olmadan gelmiş.
  # O yüzden 'v' harfini sildik:
  cd "$srcdir/$pkgname-$pkgver"

  # Uygulamayı sisteme kuran komut:
  install -Dm755 debtap-gui-gtk.py "$pkgdir/usr/bin/debtap-gui-gtk"
}
