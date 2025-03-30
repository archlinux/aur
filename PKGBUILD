# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgbase=kwin-effects-burn-my-windows
pkgname=(kwin5-effects-burn-my-windows kwin6-effects-burn-my-windows)
pkgver=46
pkgrel=1
pkgdesc='Disintegrate your windows with style.'
arch=('any')
url='https://github.com/Schneegans/Burn-My-Windows'
license=('GPL-3.0-or-later')
depends=('kwin')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Schneegans/Burn-My-Windows/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f80bdc5732708bac41a3d2c39f44e6b4e541f578ab9489701fa4f20d0e9311d')
b2sums=('010ea055047d935d8c37dac5a75944a9510e53e211a487d7952289ed4d3f8bac212c4cf36f44cc18c1fa0508e27737aaf68103664113a000f36b9872e2a12d39')

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
