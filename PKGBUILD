# Maintainer: Que Quotion <quequotion@bugmenot.com>
pkgname=compiz-cube-screensaver
pkgver=1
pkgrel=2
pkgdesc="Lock screen and rotate compiz cube"
arch=('any')
url="http://ubuntuforums.org/showthread.php?t=1865593&s=1c7f28c50a3f258e1d3404e41f098a0b&p=11418175#post11418175"
license=('GPL')
depends=('compiz' 'python' 'dbus' 'xdotool' 'xorg-xinput')
source=(compiz-screenlock-{freedesktop,gnome}.py
        org.{freedesktop,gnome}.ScreenSaver.service
        compiz-screenlock-{freedesktop,gnome}.desktop
        compiz-cube-screensaver)
md5sums=('e009d5e8d91e342dfaeb939fddaf4bdd'
         '40b13abfeeaf8d669f44ca34bc836f6c'
         'fe39d0e389e764664d8fd610c59ebb91'
         '0d1ff939325131594c8c0eb1342b3ebe'
         '55a4a317e3e5f503e2152daa950c8c2c'
         '52ed67b09a878086f41fdc250fbfcc20'
         '4ef4564b256a445348345b14a83da601')
conflicts=('xscreensaver-dbus-screenlock')
package() {
  #Python scripts
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/compiz-screenlock-freedesktop.py
  #install -Dm755 {${srcdir},${pkgdir}/usr/bin}/compiz-screenlock-gnome.py

  #Dbus services
  install -Dm644 {${srcdir},${pkgdir}/usr/share/dbus-1/services}/org.freedesktop.ScreenSaver.service
  #install -Dm644 {${srcdir},${pkgdir}/usr/share/dbus-1/services}/org.gnome.ScreenSaver.service

  #XDG Startups
  install -Dm644 {${srcdir},${pkgdir}/etc/xdg/autostart}/compiz-screenlock-freedesktop.desktop
  #install -Dm644 {${srcdir},${pkgdir}/etc/xdg/autostart}/compiz-screenlock-gnome.desktop

  #Screensaver script
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/compiz-cube-screensaver
}
