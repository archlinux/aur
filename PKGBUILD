# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname='alacritty-use-theme-git'
pkgver=r14.3915a00
pkgrel=1
pkgdesc="Small utility to switch the selected theme used by alacritty terminal."
arch=('x86_64')
url="https://github.com/christophermca/alacritty-use-theme"
license=('GPL')
depends=('alacritty>=0.13.0')
makedepends=('git')
source=("alacritty-use-theme-git::git+https://github.com/christophermca/alacritty-use-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm755 $srcdir/$pkgname/.local/share/alacritty/use-theme.sh "$pkgdir/usr/bin/alacritty-use-theme/use-theme.sh"
  install -Dm755 $srcdir/$pkgname/.local/share/alacritty/selected.toml.DEFAULT "$pkgdir/usr/share/alacritty-use-theme/selected.toml.DEFAULT"
}
