arch=(any)
depends=(zenity)
license=(gpl3)
md5sums=(SKIP)
pkgdesc="guile bindings to zenity"
pkgname=guile-zenity-git
pkgrel=1
pkgver=v0.1.r22.ge91ce3e
provides=(guile-zenity)
source=(guile-zenity::git+https://notabug.org/rain1/guile-zenity.git)
url="https://notabug.org/rain1/guile-zenity"

pkgver() {
  cd guile-zenity
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd guile-zenity
  target="$pkgdir/usr/share/guile/site"
  mkdir -p "$target"
  cp -t "$target" zenity.scm
}