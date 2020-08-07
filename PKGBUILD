# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='chromium-extension-https-everywhere'
pkgver=2020.5.20
pkgrel=2
pkgdesc='An extension that encrypts your communications with websites that offer HTTPS'
license=('GPL2')
arch=('any')
url='https://www.eff.org/https-everywhere'
depends=('chromium')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/https-everywhere-chrome-$pkgver.crx"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/EFForg/https-everywhere/ba42442493a616d3cf6cf699784fd77aec01f51f/LICENSE.txt")
noextract=("$pkgname-$pkgver.crx"
           "LICENSE-$pkgver")
b2sums=('f12885ce55ec08c0cac514a75c9d74efc448811b7b7b3539a439563a2c7dcba443a4278fbd4c158aea2a2dc45c3816f392299a167e622dc116a15c0caa5527a6'
        'b7eb9e9bce264c535ce8b060ddad72a3cb8348b3c85eb3adf391fe69ea9cd8f6e2fe7848548b7467deb483a39b3d2dfb345b3cb5d22929b78f1ba6e19ea031ee')

build() {
  echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > gcbommkclmclpchllfjekcdonpmejbdp.json
}

package() {
  install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
  install -Dm644 gcbommkclmclpchllfjekcdonpmejbdp.json "$pkgdir/usr/share/chromium/extensions/gcbommkclmclpchllfjekcdonpmejbdp.json"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
