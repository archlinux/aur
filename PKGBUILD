# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ir-standard-fonts
pkgver=20170121
pkgrel=1
pkgdesc="Iran Supreme Council of Information and Communication Technology (SCICT) standard Persian fonts."
url="https://github.com/morealaz/ir-standard-fonts"
arch=(any)
license=('unknown')
depends=('fontconfig')
makedepends=('git')
provides=('ttf-irfonts' "$pkgname")
conflicts=('ttf-irfonts' "$pkgname")
replaces=('ttf-irfonts')
source=("$pkgname::git+https://github.com/morealaz/ir-standard-fonts.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd $pkgname
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./*.ttf
}

# vim:set ts=2 sw=2 et:
