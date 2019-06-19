# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=github.com/mipimipi
pkgname=crema-git
_pkgname=crema
pkgver=1.3
pkgrel=1
pkgdesc="Manage your custom Arch Linux repositories"
arch=('any')
url="https://$_pkgorg/$_pkgname"
license=('GPL3')
source=("git://$_pkgorg/$_pkgname.git")
md5sums=(SKIP)
depends=('aurutils' 'devtools' 'rsync')
optdepends=('gnupg')
pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
