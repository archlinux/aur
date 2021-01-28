# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='chromium-extension-https-everywhere'
pkgver=2021.1.27
pkgrel=1
pkgdesc='An extension that encrypts your communications with websites that offer HTTPS'
license=('GPL2')
arch=('any')
url='https://www.eff.org/https-everywhere'
depends=('chromium')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/https-everywhere-chrome-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
b2sums=('91a35da22c5ee3703ea21e97b4c2a2031b88e72427556e814600e61f7af46d0a6755c15e404fd51cb05957feb98637e8201076df50b8a69d9fc86a61fb98736f')

build() {
  echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > gcbommkclmclpchllfjekcdonpmejbdp.json
}

package() {
  install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
  install -Dm644 gcbommkclmclpchllfjekcdonpmejbdp.json "$pkgdir/usr/share/chromium/extensions/gcbommkclmclpchllfjekcdonpmejbdp.json"
}
