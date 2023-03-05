# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=kwin-effects-burn-my-windows
pkgver=27
pkgrel=1
pkgdesc='Disintegrate your windows with style.'
arch=('any')
url='https://github.com/Schneegans/Burn-My-Windows'
license=('GPL3')
depends=('kwin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Schneegans/Burn-My-Windows/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bbca68b827ad0de6848ae99926d11b2d3babcca966e26bfad958413f141f62f1')
b2sums=('1b26b02dc4a2f64225a6bae5a38001f4d9c44bd09ded006c16be3d597e6340e35ecca2a8980680a8fd76b20e2204388aeef4d543f4ef6f66b20350ced8ea5bb2')

build() {
  cd "Burn-My-Windows-$pkgver/kwin"

  ./build.sh
}

package() {
  cd "Burn-My-Windows-$pkgver"

  install -dm0755 "$pkgdir/usr/share/kwin"
  cp -r "kwin/_build" "$pkgdir/usr/share/kwin/effects"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
