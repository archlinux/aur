# Maintainer: Matteo Nista <m.nista@hotmail.it>
pkgname=xdg-desktop-portal-gtk4-printfix-bin
pkgver=1.6.6
pkgrel=1
pkgdesc='GTK4 backend for xdg-desktop-portal with Print portal fixes (prebuilt)'
arch=('x86_64')
url='https://gitlab.com/nisby/xdg-desktop-portal-gtk4-printfix-bin'
license=('LGPL-2.1-only')
depends=('xdg-desktop-portal' 'gtk4' 'glib2' 'gdk-pixbuf2' 'glibc' 'libgcc')
provides=('xdg-desktop-portal-impl' 'xdg-desktop-portal-gtk4' 'xdg-desktop-portal-gtk4-printfix')
conflicts=('xdg-desktop-portal-gtk4' 'xdg-desktop-portal-gtk4-git' 'xdg-desktop-portal-gtk4-bin' 'xdg-desktop-portal-gtk4-printfix')
options=('!strip' '!debug')
# Built from upstream v1.6.6 + print-single-call.patch (kept in this repo).
source=("$pkgname-$pkgver.tar.gz::$url/-/releases/v$pkgver/downloads/xdg-desktop-portal-gtk4-printfix-v$pkgver-x86_64.tar.gz")
sha256sums=('a5e6dc868a9776c2690c5fd4b6aad2847c0e334116ab1c99dbbe59c42f37b0f7')

package() {
  install -Dm755 "$srcdir/xdg-desktop-portal-gtk4" "$pkgdir/usr/lib/xdg-desktop-portal-gtk4"
  install -Dm644 "$srcdir/gtk4.portal" "$pkgdir/usr/share/xdg-desktop-portal/portals/gtk4.portal"
  install -Dm644 "$srcdir/org.freedesktop.impl.portal.desktop.gtk4.service" "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.gtk4.service"
  install -Dm644 "$srcdir/xdg-desktop-portal-gtk4.service" "$pkgdir/usr/lib/systemd/user/xdg-desktop-portal-gtk4.service"
  install -Dm644 "$srcdir/xdg-desktop-portal-gtk4.desktop" "$pkgdir/usr/share/applications/xdg-desktop-portal-gtk4.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
