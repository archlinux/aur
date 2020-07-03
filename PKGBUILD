# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=gandom-fonts
pkgver=0.8
pkgrel=2
pkgdesc="A beautiful Persian font based on Samim font."
url="https://rastikerdar.github.io/gandom-font/"
arch=(any)
license=('OFL')
provides=('ttf-gandom' "$pkgname")
conflicts=('ttf-gandom' "$pkgname")
replaces=('ttf-gandom')
source=("$pkgname-$pkgver.zip::https://github.com/rastikerdar/gandom-font/releases/download/v$pkgver/gandom-font-v$pkgver.zip")
sha256sums=('a02f88ef41938332dc07a174af554494631ef756d076799ea18d1e6af2e5af66')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Gandom.{eot,ttf,woff}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Gandom-*.{eot,ttf,woff}
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
