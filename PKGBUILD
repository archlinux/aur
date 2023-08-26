# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=kwin-effects-burn-my-windows
pkgver=37
pkgrel=1
pkgdesc='Disintegrate your windows with style.'
arch=('any')
url='https://github.com/Schneegans/Burn-My-Windows'
license=('GPL3')
depends=('kwin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Schneegans/Burn-My-Windows/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e3d8b3fc522194bd883aa8551743ff9693a5b79dd6a043ac1f21d59c8708e6d5')
b2sums=('406506ceb22d8ef106b2e29cf0b616d744f7561a14467f20e1cae56c0c7f0062e9aab4ee2dc811967803d4aa90dfcba010e6a1789f062e4fd8c415b3a7009cab')

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
