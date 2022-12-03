# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gdm-tools
pkgver=1.1
pkgrel=2
pkgdesc="Tools(set-gdm-theme,gnomeconf2gdm) for theming/personlizing Gnome Login Manager (GDM)"
arch=(any)
url="https://github.com/realmazharhussain/gdm-tools"
license=('GPL3')
depends=('bash' 'dconf' 'glib2' 'gdm')
makedepends=()
backup=('etc/gdm-tools/set-gdm-theme.conf' 'etc/gdm-tools/custom.css')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/realmazharhussain/gdm-tools/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('32fb7d739c46ee1df909e766a5298a6b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
  cp -r ./libalpm "$pkgdir"/usr/share/
}
