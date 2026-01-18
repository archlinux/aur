# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname="alacritty-use-theme-git"
pkgver=r18.ffd401b
pkgrel=1
pkgdesc="Small utility to switch the selected theme used by alacritty terminal."
arch=('x86_64')
url="https://github.com/alacritty-use-theme/alacritty-use-theme"
license=('GPL-1.0-or-later')
depends=('alacritty>=0.13.0' 'go-yq')
makedepends=('git')
provides=('alacritty-use-theme')
conflicts=('alacritty-use-theme')
source=("$pkgname::git+https://github.com/alacritty-use-theme/alacritty-use-theme.git")
sha256sums=('SKIP')

pkgver() {
   cd "$pkgname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

 package() {
     cd "$pkgname"
     install -Dm755 $srcdir/$pkgname/src/use-theme.sh "$pkgdir/usr/bin/alacritty-use-theme/use-theme.sh"
     install -Dm755 $srcdir/$pkgname/src/selected.toml.DEFAULT "$pkgdir/usr/share/alacritty-use-theme/selected.toml.DEFAULT"
     install -Dm644 $srcdir/$pkgname/README.md "$pkgdir/usr/share/docs/alacritty-use-theme/README.md"
 }

