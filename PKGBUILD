# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-obs-theme-git
pkgver=r21.d90002a
pkgrel=1
pkgdesc="Soothing pastel theme for OBS Studio"
arch=('any')
url="https://github.com/catppuccin/obs"
license=('MIT')
depends=('obs-studio')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/share/obs/obs-studio/themes"
  cp themes/* "$pkgdir/usr/share/obs/obs-studio/themes/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
