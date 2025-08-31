# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgbase=kwin-effects-burn-my-windows
pkgname=(kwin5-effects-burn-my-windows kwin6-effects-burn-my-windows)
pkgver=47
pkgrel=1
pkgdesc='Disintegrate your windows with style.'
arch=('any')
url='https://github.com/Schneegans/Burn-My-Windows'
license=('GPL-3.0-or-later')
depends=('kwin')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Schneegans/Burn-My-Windows/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0bcfaddef021470d0266f98344a8c924705fca82da7c0d9ae6fa4ace7f8f3b3')
b2sums=('32c4a40fa7ce763e4653254e6a4b5dfa7995163d2c7915223ca9c93038eb35add1a3daa0c55ad1620a61d8c257c857daffe8a4adc437c42bcc20604cdac6c1b5')

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
