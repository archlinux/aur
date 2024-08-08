# Maintainer: Polis Minus <polisminus2247 at tuta dot io>
pkgname=dness-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="A dynamic dns client"
arch=("x86_64")
url='https://github.com/nickbabcock/dness'
license=('MIT')

source=("https://github.com/nickbabcock/dness/releases/download/v$pkgver/dness-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('e1cfbc1d63dd839b7a6e491474da32f0b1e6ed8aab98a5ef6d8e75add4cdf8b25fd323da482eb0ff571c98b939db583b045d60360d45762dab174ebbb9df2d72')

package() {
  cd $srcdir/dness-$pkgver-$arch-unknown-linux-musl
  install -Dm 755 dness "$pkgdir/usr/bin/dness"

  cd $srcdir/..
  install -D dness.service "$pkgdir/usr/lib/systemd/system/dness.service"
  install -D dness.timer   "$pkgdir/usr/lib/systemd/system/dness.timer"
  install -D dness.conf    "$pkgdir/etc/dness.conf"
}
