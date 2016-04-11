pkgname=pidgin-im-gnome-shell-extension
pkgver=27
pkgrel=1
pkgdesc='Make Pidgin IM conversations appear in the Gnome Shell message tray'
url='https://github.com/muffinmad/pidgin-im-gnome-shell-extension'
arch=('any')
license=('GPL')
groups=('gnome')
depends=('pidgin' 'gnome-shell>=3.10')
makedepends=('git')
source=(git://github.com/muffinmad/pidgin-im-gnome-shell-extension.git)
md5sums=('SKIP')

package() {
	cd "$srcdir/pidgin-im-gnome-shell-extension"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/pidgin@muffinmad/schemas"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/pidgin@muffinmad/locale/ru/LC_MESSAGES"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/pidgin@muffinmad/locale/de/LC_MESSAGES"
	cp dbus.xml dbus.js extension.js metadata.json convenience.js prefs.js $pkgdir/usr/share/gnome-shell/extensions/pidgin@muffinmad/
	cp schemas/gschemas.compiled $pkgdir/usr/share/gnome-shell/extensions/pidgin@muffinmad/schemas/
	cp locale/ru/LC_MESSAGES/gnome-shell-extension-pidgin.mo $pkgdir/usr/share/gnome-shell/extensions/pidgin@muffinmad/locale/ru/LC_MESSAGES/
	cp locale/de/LC_MESSAGES/gnome-shell-extension-pidgin.mo $pkgdir/usr/share/gnome-shell/extensions/pidgin@muffinmad/locale/de/LC_MESSAGES/
}
