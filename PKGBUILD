# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgbase=kwin-effects-burn-my-windows
pkgname=(kwin5-effects-burn-my-windows kwin6-effects-burn-my-windows)
pkgver=49
pkgrel=1
pkgdesc='Disintegrate your windows with style.'
arch=('any')
url='https://github.com/Schneegans/Burn-My-Windows'
license=('GPL-3.0-or-later')
depends=('kwin')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Schneegans/Burn-My-Windows/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f53fced0a14f6cf952774c1f64a1e97e43d63ab1171a3fd6a66c1d722e97bc5')
b2sums=('2e6cf6d2029b607e0bfc281e947c2a95d135fba00e8e457e82c1c529bac00b1be83fc906fff1aa8c0541e96a8e4b0e390590316eca962a2ed96c74ee608d2e85')

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
