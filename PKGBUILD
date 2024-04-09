# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=home-assistant-hacs
pkgver=1.34.0
pkgrel=1
pkgdesc='Manage and discover custom elements for Home Assistant directly from the UI'
arch=('any')
url='https://hacs.xyz'
license=('MIT')
depends=('home-assistant')
noextract=("$pkgname-$pkgver.zip")
source=("$pkgname-$pkgver.zip::https://github.com/hacs/integration/releases/download/$pkgver/hacs.zip")
sha512sums=('3852cb15dccd7b0a3438ba0d8a9e4ec9acd3f2d354b4a4238c1f3b7c136e1429d93e0612ed459d41ba5b22cc55e1620cd11a640ec0d8e4e6ba413f0cb1f044c0')
b2sums=('033b169cdd176598294749f47e76aa6cc11c29712d9f4ef5fecdfb1032393ae6ea85f3ce81f10181f5305b1d404e0e276541fd955608592d249cd803c705db96')

package() {
  local hacs_path="$pkgdir/var/lib/private/hass/custom_components/hacs"

  # ensure private has 0700 perms
  install -vdm700 "$pkgdir/var/lib/private"
  install -vd "$hacs_path"

  bsdtar --extract --file "$pkgname-$pkgver.zip" --directory "$hacs_path"
}
