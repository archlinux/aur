# Maintainer: safalski <https://git.safallama.com.np/safalski>
pkgname=typeshi-bin
_pkgname=typeshi
pkgver=0.1.21
pkgrel=1
pkgdesc="A typing application (prebuilt binary)"
arch=('x86_64')
url="https://github.com/RyuZinOh/typeshi-mirror"
license=('BSD-2-Clause')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RyuZinOh/typeshi-mirror/releases/download/v$pkgver/typeshi-bin-$pkgver-x86_64.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/RyuZinOh/typeshi-mirror/v$pkgver/LICENSE")
sha256sums=('c0306fb0ba845ff8a97ce5000cf11b752bf62daf3775d96c4273126d5d084e82'
            '47eb383c5eadf7ad1499b981bd842679d7a73275801c83a24035b7e09e7c5b83')

package() {
  install -Dm755 usr/bin/typeshi "$pkgdir/usr/bin/typeshi"
  install -Dm644 usr/share/applications/typeshi.desktop "$pkgdir/usr/share/applications/typeshi.desktop"
  install -Dm644 usr/share/icons/hicolor/scalable/apps/typeshi.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/typeshi.svg"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
