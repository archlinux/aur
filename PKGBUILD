# $Id$
# Maintainer: Omid Mottaghi Rad <omidmr at gmail dot com>
# Co-Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=gnome-shell-extension-persian-calendar-git
pkgver=r147.57bfaaa
pkgrel=1
pkgdesc="Persian calendar for Gnome Shell."
arch=(any)
url="https://github.com/omid/Persian-Calendar-for-Gnome-Shell"
license=(GPL3)
depends=('gnome-shell>=3.24')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
makedepends=(git)
install='gnome-shell-extension.install'
source=("${pkgname%-git}"::"git+https://github.com/omid/Persian-Calendar-for-Gnome-Shell")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -d "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -a "${pkgname%-git}/PersianCalendar@oxygenws.com" \
    "${pkgdir}/usr/share/gnome-shell/extensions/PersianCalendar@oxygenws.com"
}
# vim:set ts=2 sw=2 et:
