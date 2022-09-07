# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname='chromium-extension-https-everywhere'
pkgver=2022.5.24
pkgrel=1
pkgdesc='An extension that encrypts your communications with websites that offer HTTPS'
license=('GPL2')
arch=('any')
url='https://www.eff.org/https-everywhere'
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/https-everywhere-chrome-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
sha256sums=("98ac5581c91defdfabb66f94ddf32706c183c2cd3cb93485bed68ce1773bc042")

build() {
  echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > gcbommkclmclpchllfjekcdonpmejbdp.json
}

package() {
  install -Dvm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
  install -Dvm644 gcbommkclmclpchllfjekcdonpmejbdp.json "$pkgdir/usr/share/chromium/extensions/gcbommkclmclpchllfjekcdonpmejbdp.json"
}
