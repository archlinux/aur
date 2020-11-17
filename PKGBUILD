# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='chromium-extension-https-everywhere'
pkgver=2020.11.17
pkgrel=1
pkgdesc='An extension that encrypts your communications with websites that offer HTTPS'
license=('GPL2')
arch=('any')
url='https://www.eff.org/https-everywhere'
depends=('chromium')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/https-everywhere-chrome-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
b2sums=('cf2a0e9debc0839bfb6f48a891da8950767586efa4a229b861b0ff79ba17ce7dacc2d31de24ab164aba071c15077055797bfcda59191084589a0d7ba8c926c15')

build() {
  echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > gcbommkclmclpchllfjekcdonpmejbdp.json
}

package() {
  install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
  install -Dm644 gcbommkclmclpchllfjekcdonpmejbdp.json "$pkgdir/usr/share/chromium/extensions/gcbommkclmclpchllfjekcdonpmejbdp.json"
}
