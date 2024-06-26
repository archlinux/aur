# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gdm-tools-git
pkgver=1.2.r7.g4294817
pkgrel=2
epoch=1
pkgdesc="Tools for theming/personalizing Gnome Login Manager (GDM)"
arch=(any)
url="https://github.com/realmazharhussain/gdm-tools"
license=('GPL-3.0-or-later')
depends=('bash' 'dconf' 'glib2-devel' 'gdm')
makedepends=('git')
provides=('gdm-tools' 'set-gdm-theme' 'gnomeconf2gdm')
conflicts=('gdm-tools')
backup=('etc/gdm-tools/set-gdm-theme.conf' 'etc/gdm-tools/custom.css')
source=("$pkgname"::'git+https://github.com/realmazharhussain/gdm-tools.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname}"
  DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
  cp -r ./libalpm "$pkgdir"/usr/share/
}
