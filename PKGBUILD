# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=ascii-chat
pkgver=0.3.29
pkgrel=1
pkgdesc="Video chat in your terminal"
arch=('x86_64')
url="https://github.com/zfogg/ascii-chat"
license=('MIT')
depends=()
optdepends=(
  'v4l-utils: webcam device utilities'
)

source=("$pkgname-$pkgver-Linux-amd64.sh::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.sh")
sha256sums=('ab5784b22b94b8b91716c59028fb5ba9b369f750b81783d8d7d200f7bf488f7a')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr"
  chmod +x "$pkgname-$pkgver-Linux-amd64.sh"
  "./$pkgname-$pkgver-Linux-amd64.sh" --prefix="$pkgdir/usr" --skip-license --exclude-subdir
}
