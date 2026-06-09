# Maintainer: haak <halkelleher@gmail.com>

pkgname=redu-bin
_pkgname=${pkgname%-bin}
pkgver=0.2.15
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="ncdu for your restic repository"
url="https://github.com/drdo/redu/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("LICENSE::https://raw.githubusercontent.com/drdo/redu/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-linux-$CARCH.bz2::https://github.com/drdo/redu/releases/download/v$pkgver/$_pkgname-$pkgver-linux-$CARCH.bz2")
source_aarch64=("$_pkgname-$pkgver-linux-arm64.bz2::https://github.com/drdo/redu/releases/download/v$pkgver/$_pkgname-$pkgver-linux-arm64.bz2")
sha512sums=('1cc874c6d2b38d0c12c8e1069502ffb3ef5cabc9a86ad036009d55a0f2f62085de43c30c890b3cb6b875c08cef1da68b8b408218f3753031072bab3bb1bc26a9')
sha512sums_x86_64=('7d947b59f20ac365da2287449bcb86aa3efb9d2efacb48115771525dd73b759ee447476b7530a2885bc0d4c2c6e7f956fde5d5ed3eaee998313d3cebcbeb6a1c')
sha512sums_aarch64=('50e185b5e9997d88b8d2b242094a1030293f8f1b0183384f8484398c1a4c49e88fb86f519489ecaa244d8c031545def7b232595cc2eb6de4aea51a396c728fb6')

package() {
  local _asset_arch="$CARCH"
  [[ "$CARCH" == aarch64 ]] && _asset_arch=arm64

  install -Dm0755 "$srcdir/$_pkgname-$pkgver-linux-$_asset_arch" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2:
