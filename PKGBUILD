# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=gdm-tools-git
pkgver=42.ad62c99
pkgrel=2
pkgdesc="Tools for theming/personlizing Gnome Login Manager (GDM)"
arch=(any)
url="https://github.com/realmazharhussain/gdm-tools"
license=('GPL v3')
depends=('bash' 'dconf' 'glib2' 'gdm')
makedepends=()
provides=('gdm-tools' 'set-gdm-theme' 'gnomeconf2gdm')
conflicts=('gdm-tools')
source=("$pkgname"::'git+https://github.com/realmazharhussain/gdm-tools.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "${pkgname}"
    DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
}
