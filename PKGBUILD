# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname='chromium-extension-https-everywhere'
pkgver=2021.4.15
pkgrel=1
pkgdesc='An extension that encrypts your communications with websites that offer HTTPS'
license=('GPL2')
arch=('any')
url='https://www.eff.org/https-everywhere'
depends=('chromium')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/https-everywhere-chrome-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
b2sums=('c2f509ffcc4e4424700cb26d315dc1e03b65bcf585133f1bd3a91af9264f9e41f2e725c87299772e556783b7cc0eb4cf89548b036c0494da797b3dc02849ffcb')

build() {
  echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > gcbommkclmclpchllfjekcdonpmejbdp.json
}

package() {
  install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
  install -Dm644 gcbommkclmclpchllfjekcdonpmejbdp.json "$pkgdir/usr/share/chromium/extensions/gcbommkclmclpchllfjekcdonpmejbdp.json"
}
