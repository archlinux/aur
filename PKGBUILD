# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=osxiv-git
_gitname=osxiv
pkgver=0.r290.264b912
pkgrel=1
pkgdesc='Overly Simple X Image Viewer'
url='https://github.com/Baitinq/osxiv.git'
arch=('any')
license=('GPL')
depends=()
makedepends=('git' 'sdl2' 'sdl2_image')
provides=('osxiv')

source=("git+https://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  make

  mkdir -p $pkgdir/usr/bin/
  mv osxiv $pkgdir/usr/bin/osxiv
  chmod +x $pkgdir/usr/bin/osxiv
}
