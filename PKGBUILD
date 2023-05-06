# Maintainer: somini <dev@somini.xyz>
# Maintainer: Qontinuum <qontinuum@artixlinux.org>

pkgname='firefox-extension-privacy-redirect'
pkgver=1.1.49
pkgrel=2
pkgdesc="Redirect Youtube, Twitter, Instagram, ... to privacy friendly alternatives"
license=('GPL3')
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SimonBrazell/privacy-redirect/archive/v$pkgver.tar.gz")
b2sums=('b6767e1b63cd42d21410cf277f7a203d25b14e75969c2218718069ed2462d733cec9a3666cb58fbcee5126d3c8b83f7e3c76a140c5c9212f7886672086f9008b')

prepare() {
  cd "privacy-redirect-$pkgver"
  npm install
}

build() {
  cd "privacy-redirect-$pkgver"
  npm run build
}

check() {
  cd "privacy-redirect-$pkgver"
  npm run test
}

package() {
  cd "privacy-redirect-$pkgver/web-ext-artifacts"
  install -Dm644 "privacy_redirect-$pkgver.zip" "$pkgdir/usr/lib/firefox/browser/extensions/{b7f9d2cd-d772-4302-8c3f-eb941af36f76}.xpi"
}
# vim:set sw=2 et:
