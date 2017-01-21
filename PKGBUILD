# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=iran-nastaliq-fonts
pkgver=20150704
pkgrel=1
pkgdesc="A free Unicode calligraphic Persian font."
url="https://github.com/font-store/font-IranNastaliq"
arch=(any)
license=('OFL')
depends=('fontconfig')
makedepends=('git')
provides=('ttf-iran-nastaliq' "$pkgname")
conflicts=('ttf-iran-nastaliq' "$pkgname")
replaces=('ttf-iran-nastaliq')
source=("$pkgname::git+https://github.com/font-store/font-IranNastaliq.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd $pkgname
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./old/*.ttf
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./WebFonts/{*.ttf,*.woff*}
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
