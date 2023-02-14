# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gdm-tools
pkgver=1.2
pkgrel=1
pkgdesc="Command-line tools for GNOME's login manager, GDM"
arch=(any)
url="https://github.com/realmazharhussain/gdm-tools"
license=(GPL3)
depends=(bash dconf glib2 gdm)
backup=('etc/gdm-tools/set-gdm-theme.conf' 'etc/gdm-tools/custom.css')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/realmazharhussain/gdm-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(fe19e031c3030e4cc6b460edf5e52acbed5a47e43e51b6d05978970cb70fc31c)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
  cp -r ./libalpm "$pkgdir"/usr/share/
}
