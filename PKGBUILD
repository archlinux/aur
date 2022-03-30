# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Joseph Diza <josephm.diza@gmail.com>
pkgname=marwaita-icons-git
#pkgver=r3.d18eeee
pkgver=r3.d18eeee
pkgrel=1
pkgdesc="Icon pack for linux"
arch=('any')
url="https://github.com/darkomarko42/Marwaita-Icons"
license=('custom')
makedepends=('git')
_pkgname=Marwaita-Icons
source=("${_pkgname}::git+https://github.com/darkomarko42/Marwaita-Icons")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  ICON_DIR="$pkgdir/usr/share/icons"
  mkdir -p "$ICON_DIR"
  cp -rf "Marwaita" "$ICON_DIR"
  cp -rf "Marwaita-Dark" "$ICON_DIR"
  cp -rf "Marwaita-Light" "$ICON_DIR"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
