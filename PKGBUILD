# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>
_pkgname=drop-down-terminal
pkgname=gnome-shell-extension-$_pkgname
pkgver=24p1
pkgrel=1
pkgdesc="Drop Down Terminal extension for the Gnome Shell"
arch=('any')
url="https://github.com/zzrough/gs-extensions-$_pkgname"
license=('GPL3')
depends=('gnome-shell')
install=$_pkgname.install
_commit=7f777b6e3a72f28c74cd54f64e60408e6e1f3495
source=($_pkgname-$pkgver.tar.gz::https://github.com/zzrough/gs-extensions-$_pkgname/archive/$_commit.tar.gz)
sha256sums=('e358ab231dcfd36f5948e6012fcd135ae9cfd51929050459312dc331acffc3c8')

package() {
  _uuid='drop-down-terminal@gs-extensions.zzrough.org'

  install -d "$pkgdir"/usr/share/gnome-shell/extensions
  install -d "$pkgdir"/usr/share/glib-2.0/schemas

  cd "$srcdir"/gs-extensions-drop-down-terminal-$_commit #-$pkgver
  mv $_uuid/org.zzrough.gs-extensions.drop-down-terminal.gschema.xml \
    "$pkgdir"/usr/share/glib-2.0/schemas/
  cp -af $_uuid "$pkgdir"/usr/share/gnome-shell/extensions/
}
