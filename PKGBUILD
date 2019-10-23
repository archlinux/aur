# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=thytom
pkgname=dwmbar-git
_gitname=dwmbar
pkgver=0.r74.
pkgrel=1
pkgdesc='Simple and modular status bar for dwm.'
url='https://github.com/thytom/dwmbar.git'
arch=('any')
license=('GPL')
optdepends=('dwm')
makedepends=('git')
provides=('dwmbar')

source=("git://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short
HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  # Install the program.
  mkdir -p "$pkgdir/usr/share/$_gitname/modules"
  install -Dm755 dwmbar "$pkgdir/usr/bin/$_gitname"
  cp -a --no-preserve=ownership * "$pkgdir/usr/share/$_gitname"
  chmod +x "$pkgdir/usr/bin/$_gitname"
# chmod -R 777 "$pkgdir/usr/share/$_gitname"
}
