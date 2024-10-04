# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=git-branch-manager
pkgver=0.1.r.
pkgrel=1
pkgdesc="Manage your git branches with ease"
arch=(any)
url="https://github.com/demonkingswarn/git-branch-manager"
license=('GPL')
depends=(git gum)
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -Dt "$pkgdir"/usr/bin/ "$pkgname"

  install -Dt "$pkgdir"/usr/share/licenses/"$pkgname"/ LICENSE

  install -Dt "$pkgdir"/usr/share/doc/"$pkgname"/  README.md
}
