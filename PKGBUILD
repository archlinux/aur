# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=home-assistant-hacs
pkgver=1.33.0
pkgrel=1
pkgdesc='Home Assistant Community Store'
arch=('any')
url='https://hacs.xyz'
license=('MIT')
depends=('home-assistant')
noextract=("$pkgname-$pkgver.zip")
source=("$pkgname-$pkgver.zip::https://github.com/hacs/integration/releases/download/$pkgver/hacs.zip")
sha512sums=('0e542a125e2340492b9792ba501e2c500fd3524d59b63e5c714b3f362a9c90871969452b3f15359d77cbf7a75d7e216986b301b740203dddde47e373303982e0')
b2sums=('fbd5040b4771d183cd46e382c1bf9fb3a7846cb828d7736e2cd0495107f4551f3aed38a445e6b7696f4cef6dec926f682e5fbdb9ca82de54ae3ffe86182c2d8d')

package() {
  local hacs_path="$pkgdir/var/lib/private/hass/custom_components/hacs"

  # ensure private has 0700 perms
  install -vdm700 "$pkgdir/var/lib/private"
  install -vd "$hacs_path"

  bsdtar --extract --file "$pkgname-$pkgver.zip" --directory "$hacs_path"
}
