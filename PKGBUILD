# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=gdm-tools-git
pkgver=73.d20c840
pkgrel=1
pkgdesc="Tools(set-gdm-theme,gnomeconf2gdm) for theming/personlizing Gnome Login Manager (GDM)"
packager="Mazhar Hussain <mmazharhussainkgb1145@gmail.com>"
arch=(any)
url="https://github.com/realmazharhussain/gdm-tools"
license=('GPL3')
depends=('bash' 'dconf' 'glib2' 'gdm')
makedepends=()
provides=('gdm-tools' 'set-gdm-theme' 'gnomeconf2gdm')
conflicts=('gdm-tools')
backup=('etc/gdm-tools/set-gdm-theme.conf' 'etc/gdm-tools/custom.css')
source=("$pkgname"::'git+https://github.com/realmazharhussain/gdm-tools.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${pkgname}"
  DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
  cp -r ./libalpm "$pkgdir"/usr/share/
}
