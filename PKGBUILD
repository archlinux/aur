# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=gandom-fonts
pkgver=0.7
pkgrel=1
pkgdesc="A beautiful Persian font based on Samim font."
url="https://rastikerdar.github.io/gandom-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-gandom' "$pkgname")
conflicts=('ttf-gandom' "$pkgname")
replaces=('ttf-gandom')
source=("$pkgname-$pkgver.zip::https://github.com/rastikerdar/gandom-font/releases/download/v$pkgver/gandom-font-v$pkgver.zip")
sha256sums=('822ec15f79c3c7bb9f4d338925e904f9ee4feda857bea31e38cc42c717a7cb82')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Gandom.{eot,ttf,woff}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Gandom-*.{eot,ttf,woff}
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
