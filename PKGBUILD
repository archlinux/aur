# Maintainer: ZXY595 <3303057136@qq.com>
_pkgname=waybar-niri-windows
pkgname=$_pkgname-bin
pkgver=2.3.0
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
sha256sums=('b145a7752e762a700a05e9a43dd0ccd61a6babdecb2ac7eb698d285c9135467c'
            '3d493b853d53b9781762b2695a9949b688b206b9578f21c0c916566679ae7181')

package() {
  install -Dm 755 "$pkgname-$pkgver.so" "$pkgdir/usr/lib/$_pkgname.so"
  install -Dm644 "$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
