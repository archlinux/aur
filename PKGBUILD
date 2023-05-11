# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=archy-dwm
pkgver=1.0.0
pkgrel=1
pkgdesc="A dynamic window manager for X with some patches applied"
url="https://github.com/archy-linux/$pkgname"
arch=('i686' 'x86_64')
license=('MIT')
options=()
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'archy-slstatus' 'archy-dmenu')
install=
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/archy-linux/$pkgname/archive/refs/tags/$pkgname_$pkgver.tar.gz")
sha256sums=('4e56232bd78971e20a9e6fa7dda16f7047be086aa3a066f5c410c4e3ae5d7add')

package() {
  cd "$pkgname_$pkgver" || exit 1
  # shellcheck disable=SC2154
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/xsessions/$pkgname.desktop"
}
