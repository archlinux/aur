# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: FUBAR

pkgname=adesklet-calendar
pkgver=0.5.3
pkgrel=8
pkgdesc="A simple desklet that displays a calendar"
arch=('any')
url="http://adesklets.sourceforge.net/desklets.html"
license=('GPL')
depends=('adesklets')
source=(http://downloads.sourceforge.net/sourceforge/adesklets/Calendar-$pkgver.tar.bz2)
sha256sums=('2ed3875cd3fc701a65ec1ffca885e2adf4f8a26e314bf2fa56ae447dfdeae49f')

package() {
  cd "${srcdir}"/Calendar-$pkgver

  install -d "${pkgdir}"/usr/share/adesklets/Calendar
  cp -a "${srcdir}"/Calendar-$pkgver/* "${pkgdir}"/usr/share/adesklets/Calendar/
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' "${pkgdir}"/usr/share/adesklets/Calendar/Calendar.py
  chown root:adesklets "${pkgdir}"/usr/share/adesklets/Calendar
  chmod 775 "${pkgdir}"/usr/share/adesklets/Calendar
}
