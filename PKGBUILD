pkgname=python-home-assistant-hacs
pkgver=2.0.1
pkgrel=1
pkgdesc='Manage and discover custom elements for Home Assistant directly from the UI'
arch=('any')
url='https://hacs.xyz'
license=('MIT')
depends=('home-assistant')
replaces=('home-assistant-hacs')
conflicts=('home-assistant-hacs')
noextract=("$pkgname-$pkgver.zip")
source=("$pkgname-$pkgver.zip::https://github.com/hacs/integration/releases/download/$pkgver/hacs.zip")
sha512sums=('054113ec720d31c504ab74e5c19d2a3d064f0f7e6df6d4542bc8b27061d938f7f7d89503494a893d2379940e1902ec50f75e4e1de28818c2d10aaa10c3b13d12')
b2sums=('580c31aeca783040fb7cee1418867d3ba667ca7f9eec91d21ee041a922501ea8f07cfdb5d0490ae758d5d777c495d135ab5697282c35afb976ee0426d5046c95')

package() {
  local hacs_path="$pkgdir/var/lib/private/hass/custom_components/hacs"

  # ensure private has 0700 perms
  install -vdm700 "$pkgdir/var/lib/private"
  install -vd "$hacs_path"

  bsdtar --extract --file "$pkgname-$pkgver.zip" --directory "$hacs_path"
}
