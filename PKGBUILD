# Maintainer: Matteo Nista <m.nista@hotmail.it>
pkgname=xdg-desktop-portal-gtk4-printfix-bin
pkgver=1.6.6.r6.g65734b6
pkgrel=1
pkgdesc='GTK4 backend for xdg-desktop-portal, prebuilt from upstream master (Print portal fix included upstream)'
arch=('x86_64')
url='https://gitlab.com/nisby/xdg-desktop-portal-gtk4-bin'
license=('LGPL-2.1-only')
depends=('xdg-desktop-portal' 'gtk4' 'glib2' 'gdk-pixbuf2' 'glibc' 'libgcc')
provides=('xdg-desktop-portal-impl' 'xdg-desktop-portal-gtk4' 'xdg-desktop-portal-gtk4-printfix')
conflicts=('xdg-desktop-portal-gtk4' 'xdg-desktop-portal-gtk4-git' 'xdg-desktop-portal-gtk4-bin' 'xdg-desktop-portal-gtk4-printfix')
options=('!strip' '!debug')
# Built from upstream master 65734b6; the Print fix and the page-setup warning fix are upstream.
source=("$pkgname-$pkgver.tar.gz::$url/-/releases/v$pkgver/downloads/xdg-desktop-portal-gtk4-v$pkgver-x86_64.tar.gz")
sha256sums=('eacd1d2de0bcbb4f033ba262fc99d1cd85f127966dc93c0eb7dfd2d5952b84a0')

package() {
  install -Dm755 "$srcdir/xdg-desktop-portal-gtk4" "$pkgdir/usr/lib/xdg-desktop-portal-gtk4"
  install -Dm644 "$srcdir/gtk4.portal" "$pkgdir/usr/share/xdg-desktop-portal/portals/gtk4.portal"
  install -Dm644 "$srcdir/org.freedesktop.impl.portal.desktop.gtk4.service" "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.gtk4.service"
  install -Dm644 "$srcdir/xdg-desktop-portal-gtk4.service" "$pkgdir/usr/lib/systemd/user/xdg-desktop-portal-gtk4.service"
  install -Dm644 "$srcdir/xdg-desktop-portal-gtk4.desktop" "$pkgdir/usr/share/applications/xdg-desktop-portal-gtk4.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
