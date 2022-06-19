# Maintainer: Que Quotion <quequotion@bugmenot.com>
pkgname=xscreensaver-dbus-screenlock
pkgver=5
pkgrel=2
pkgdesc="DE integrated screen-locking with xscreensaver"
arch=('any')
url="http://ubuntuforums.org/showthread.php?t=1865593&s=1c7f28c50a3f258e1d3404e41f098a0b&p=11418175#post11418175"
license=('GPL')
depends=('xscreensaver' 'python' 'dbus')
source=(xscreensaver-dbus-screenlock-{freedesktop,gnome}.py
        org.{freedesktop,gnome}.ScreenSaver.service
        xscreensaver-dbus-screenlock-{freedesktop,gnome}.desktop)
md5sums=('b1416eb05646ad70a89d86ff5bc18584'
         'ea8a4cc94bebee450f5270b140c3b423'
         '9181f92d592549c5506a9722b47b7e94'
         '8802e2b10232e39fe98b8c6e7228c83a'
         '65a7fb8a4d3e8183009e9caffc3e587a'
         '90ebf9aabc89691dd20f70c78506daea')
package() {
  #Python scripts
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/xscreensaver-dbus-screenlock-freedesktop.py
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/xscreensaver-dbus-screenlock-gnome.py

  #Dbus services
  install -Dm644 {${srcdir},${pkgdir}/usr/share/dbus-1/services}/org.freedesktop.ScreenSaver.service
  install -Dm644 {${srcdir},${pkgdir}/usr/share/dbus-1/services}/org.gnome.ScreenSaver.service

  #XDG Startups
  install -Dm644 {${srcdir},${pkgdir}/etc/xdg/autostart}/xscreensaver-dbus-screenlock-freedesktop.desktop
  install -Dm644 {${srcdir},${pkgdir}/etc/xdg/autostart}/xscreensaver-dbus-screenlock-gnome.desktop
}
