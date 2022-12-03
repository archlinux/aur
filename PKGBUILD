# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gdm-tools-git
pkgver=1.1+3+g8428fac
pkgrel=1
epoch=1
pkgdesc="Tools(set-gdm-theme,gnomeconf2gdm) for theming/personlizing Gnome Login Manager (GDM)"
arch=(any)
url="https://github.com/realmazharhussain/gdm-tools"
license=('GPL3')
depends=('bash' 'dconf' 'glib2' 'gdm')
makedepends=('git')
provides=('gdm-tools' 'set-gdm-theme' 'gnomeconf2gdm')
conflicts=('gdm-tools')
backup=('etc/gdm-tools/set-gdm-theme.conf' 'etc/gdm-tools/custom.css')
source=("$pkgname"::'git+https://github.com/realmazharhussain/gdm-tools.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --long | sed -e 's/^v//' -e 's/-/+/g'
}

package() {
  cd "${pkgname}"
  DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
  cp -r ./libalpm "$pkgdir"/usr/share/
}
