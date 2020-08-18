# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='chromium-extension-https-everywhere'
pkgver=2020.8.13
pkgrel=1
pkgdesc='An extension that encrypts your communications with websites that offer HTTPS'
license=('GPL2')
arch=('any')
url='https://www.eff.org/https-everywhere'
optdepends=('chromium: Use it in a chromium based browser')
changelog="$pkgname.changelog"
replaces=('https-everywhere-chrome')
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/https-everywhere-chrome-$pkgver.crx"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/EFForg/https-everywhere/2d5e13146fe77968c61c8f6a500d5ad3c5d2f6a8/LICENSE.txt")
noextract=("$pkgname-$pkgver.crx"
           "LICENSE-$pkgver")
b2sums=('8183ccf4d215ef4fb67ef193205b42bb0a62fef8a21ed84f39b9f8c01614e5b6687430e48fdf3e8307dcb4ee2d073f5e621977b20c671b86d84eed228f4b6597'
        'b7eb9e9bce264c535ce8b060ddad72a3cb8348b3c85eb3adf391fe69ea9cd8f6e2fe7848548b7467deb483a39b3d2dfb345b3cb5d22929b78f1ba6e19ea031ee')

build() {
  echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > gcbommkclmclpchllfjekcdonpmejbdp.json
}

package() {
  install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
  install -Dm644 gcbommkclmclpchllfjekcdonpmejbdp.json "$pkgdir/usr/share/chromium/extensions/gcbommkclmclpchllfjekcdonpmejbdp.json"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
