# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname="alacritty-use-theme"
pkgver=1.0.0
pkgrel=1
pkgdesc="Small utility to switch the selected theme used by alacritty terminal."
arch=('x86_64')
url="https://github.com/alacritty-use-theme/alacritty-use-theme"
license=('GPL-1.0-or-later')
depends=('alacritty>=0.13.0' 'go-yq')
provides=('alacritty-use-theme')
conflicts=('alacritty-use-theme-git')
source=("$pkgname-$pkgver::http://github.com/alacritty-use-theme/alacritty-use-theme/archive/refs/tags/v$pkgver.tar.gz")


package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $srcdir/$pkgname-$pkgver/src/use-theme.sh "$pkgdir/usr/bin/alacritty-use-theme/use-theme.sh"
  install -Dm755 $srcdir/$pkgname-$pkgver/src/selected.toml.DEFAULT "$pkgdir/usr/share/alacritty-use-theme/selected.toml.DEFAULT"
  install -Dm644 $srcdir/$pkgname-$pkgver/README.md "$pkgdir/usr/share/docs/alacritty-use-theme/README.md"
}
sha256sums=('097237b43055f918631b5fe5a6aafd8778b4c801363da10942610241633f4dc7')
