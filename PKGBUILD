pkgname=pidgin-gnome-shell-extension-git
pkgver=96.c10caca
pkgrel=1
_gitname=gnome-shell-extensions-pidgin
pkgdesc="A GNOME Shell extension that provides integration with Pidgin."
arch=('any')
url="https://github.com/Psykar/gnome-shell-extensions-pidgin"
license=('unknown')
depends=('gnome-shell' 'pidgin')
makedepends=('git')
source=('git://github.com/xiehuc/gnome-shell-extensions-pidgin.git')
sha1sums=('SKIP')
 
package() {
  cd gnome-shell-extensions-pidgin/pidgin-conversation-integration@kagesenshi.org
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/pidgin-conversation-integration@kagesenshi.org"
  cp dbus.js extension.js metadata.json stylesheet.css "$pkgdir/usr/share/gnome-shell/extensions/pidgin-conversation-integration@kagesenshi.org/"
} 

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
