# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgbase=kwin-effects-burn-my-windows
pkgname=(kwin5-effects-burn-my-windows kwin6-effects-burn-my-windows)
pkgver=45
pkgrel=1
pkgdesc='Disintegrate your windows with style.'
arch=('any')
url='https://github.com/Schneegans/Burn-My-Windows'
license=('GPL-3.0-or-later')
depends=('kwin')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Schneegans/Burn-My-Windows/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a8453926ce5b44e28f36794b7f63b1fd466e8bfeefd14ed6c33a5377468f894f')
b2sums=('26c2013044aee24ef57433384d93e9fd72d3b230726aabd10dae6629972b9fc07d8b29d5196d9d11165e3918509ec6044f94eb53b36fba01966ae813f92fa0a6')

build() {
  cd "Burn-My-Windows-$pkgver/kwin"

  ./build.sh
}

package_kwin5-effects-burn-my-windows() {
  cd "Burn-My-Windows-$pkgver"

  install -dm0755 "$pkgdir/usr/share/kwin/effects"
  cp -r -t "$pkgdir/usr/share/kwin/effects" "kwin/_build"/kwin5_*

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_kwin6-effects-burn-my-windows() {
  conflicts=('kwin-effects-burn-my-windows')
  replaces=('kwin-effects-burn-my-windows')

  cd "Burn-My-Windows-$pkgver"

  install -dm0755 "$pkgdir/usr/share/kwin/effects"
  cp -r -t "$pkgdir/usr/share/kwin/effects" "kwin/_build"/kwin6_*

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
