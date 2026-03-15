# Maintainer: Stephen Power <simpilldev@gmail.com>

pkgname="helix-themes-cptpotato"
description="A set of themes for the Helix text editor made by CptPotato."
pkgver=latest.r11.g1fca5dc
pkgrel=1
groups=()
arch=('x86_64')
pkgdesc=
url="https://github.com/CptPotato/helix-themes"
license=()
depends=()
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  chmod +x "$srcdir"/"$pkgname"/build.sh
  mkdir -p ~/.config/helix/themes/
}

build() {
  cd "$srcdir"/"$pkgname"
  ./build.sh
}

package() {
  cp "$srcdir"/"$pkgname"/build/* ~/.config/helix/themes/
}
