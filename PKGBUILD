# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgbase=kwin-effects-burn-my-windows
pkgname=(kwin5-effects-burn-my-windows kwin6-effects-burn-my-windows)
pkgver=48
pkgrel=1
pkgdesc='Disintegrate your windows with style.'
arch=('any')
url='https://github.com/Schneegans/Burn-My-Windows'
license=('GPL-3.0-or-later')
depends=('kwin')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Schneegans/Burn-My-Windows/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e25a91dcfd35a06a6f1acadce63ea5d92c975e9855e6d023b8f04d525d681e2d')
b2sums=('aecf6ab5d603eec7a54f115bfc3419b3ff721e45910188861bfe20f948dc2994c1840b38851dd3a8a47efe530cbbce27b230447765a13672507c68b222eb3b79')

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
