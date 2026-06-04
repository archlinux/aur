# Maintainer: ZXY595 <3303057136@qq.com>
_pkgname=waybar-niri-windows
pkgname=$_pkgname-bin
pkgver=2.3.1
pkgrel=1
pkgdesc='Niri focus indicator for Waybar'
arch=('x86_64')
url="https://github.com/calico32/$_pkgname"
license=('MIT')
depends=('waybar' 'niri>=25.08' 'glibc')
conflicts=("$_pkgname")
source=(
	"$pkgname-$pkgver.so::$url/releases/download/v$pkgver/$_pkgname.so"
	"$pkgname-$pkgver.zip::$url/archive/refs/tags/v$pkgver.zip"
)
sha256sums=('6ae40a7ac277a1a46a823933213a5e0585b2c2a16374c225c66e17730304e533'
            '6cc9aeccaa35663710178a0d2c2b967e53db21a7462f41b6c7c1b9f8a7d632db')

package() {
  install -Dm 755 "$pkgname-$pkgver.so" "$pkgdir/usr/lib/$_pkgname.so"
  install -Dm644 "$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
