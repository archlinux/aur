arch=(any)
depends=(zenity)
license=(gpl3)
md5sums=(SKIP)
pkgdesc='guile bindings to zenity'
pkgname=guile-zenity-git
_gitname=guile-zenity
pkgrel=1
pkgver=v0.1.r21.g6853063
provides=(guile-zenity)
source=(guile-zenity::git+https://notabug.org/rain1/guile-zenity.git)
url="https://notabug.org/rain1/guile-zenity"

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  dest="$pkgdir/usr/share/guile/site"
  mkdir -p "$dest"
  cp -t "$dest" zenity.scm
}