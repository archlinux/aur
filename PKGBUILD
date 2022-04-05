# Maintainer: Anty0 <anty150 at gmail dot com>

pkgname='updaurpkg-git'
_pkgname='updaurpkg'
pkgver=4.37ac19a
pkgrel=1
pkgdesc="Simple tool to automatize checking for upstream updates of arch linux user repository packages"
arch=('any')
url="https://github.com/Anty0/updaurpkg"
license=('GPL')
depends=('git' 'jq')
makedepends=()
provides=('updaurpkg')
conflicts=('updaurpkg')
source=('git+https://github.com/Anty0/updaurpkg')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m755 updaurpkg "${pkgdir}/usr/bin/updaurpkg"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
