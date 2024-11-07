# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=kwin-effects-burn-my-windows
pkgver=44
pkgrel=1
pkgdesc='Disintegrate your windows with style.'
arch=('any')
url='https://github.com/Schneegans/Burn-My-Windows'
license=('GPL-3.0-or-later')
depends=('kwin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Schneegans/Burn-My-Windows/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3c4107d5fbc14aa8ef898287e685b15e1cfb0f740ce743a48a65831c61e0fc2')
b2sums=('8a53408807cd1650047cdc9b76a48183c9ad4d0cbb4d26eba16e2ebae2307826a0ee9e72e7027517bbb9cc845cf23d10ff772b6ee01b4d42693b517305a81231')

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
