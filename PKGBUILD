# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=kwin-effects-burn-my-windows
pkgver=36
pkgrel=1
pkgdesc='Disintegrate your windows with style.'
arch=('any')
url='https://github.com/Schneegans/Burn-My-Windows'
license=('GPL3')
depends=('kwin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Schneegans/Burn-My-Windows/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c5937fa01cf5c3f0fe280171fca7a87263d8c0c2753e954669cdb7d03a59e5c')
b2sums=('597bb6763437f3fe5d9872b40afdb589fdbed665962048649848986f42adc4ac16f83e97aef5d93acb5c0e406d3c5ca9130fc9e717120517e00860a1873c8450')

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
