# Maintainer: Morris Jobke <hey at morrisjobke dot de>
# Contributor: jtts
# Contributor: Christian METZLER <neroth@xeked.com>

pkgname=gnome-shell-extension-skypenotification-git
pkgver=20140501
pkgrel=1
pkgdesc="A Gnome Shell extension that integrates Skype into GNOME Shell."
arch=(any)
url="https://github.com/chrisss404/gnome-shell-ext-SkypeNotification"
license=(GPL3)
depends=(python-dbus gnome-shell skype)
makedepends=(git)
#replaces=('')
install='gnome-shell-extension.install'
source=("$pkgname"::"git+https://github.com/chrisss404/gnome-shell-ext-SkypeNotification")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -dm755 SkypeNotification@chrisss404.gmail.com $pkgdir/usr/share/gnome-shell/extensions/SkypeNotification@chrisss404.gmail.com
  cp -r SkypeNotification@chrisss404.gmail.com $pkgdir/usr/share/gnome-shell/extensions/
  rm -rf $pkgdir/usr/share/gnome-shell/extensions/SkypeNotification@chrisss404.gmail.com/schemas
  install -Dm644 SkypeNotification@chrisss404.gmail.com/schemas/org.gnome.shell.extensions.skype-integration.gschema.xml $pkgdir/usr/share/gnome-shell/extensions/SkypeNotification@chrisss404.gmail.com/schemas/org.gnome.shell.extensions.skype-integration.gschema.xml
  pushd $pkgdir/usr/share/gnome-shell/extensions/SkypeNotification@chrisss404.gmail.com/schemas/
  /usr/bin/glib-compile-schemas .
  popd  
  install -Dm644 README.md $pkgdir/usr/share/gnome-shell/extensions/SkypeNotification@chrisss404.gmail.com/README.md
  install -Dm644 data/screenshot1.jpg $pkgdir/usr/share/gnome-shell/extensions/SkypeNotification@chrisss404.gmail.com/data/screenshot1.jpg
  install -Dm644 data/screenshot2.jpg $pkgdir/usr/share/gnome-shell/extensions/SkypeNotification@chrisss404.gmail.com/data/screenshot2.jpg
}
