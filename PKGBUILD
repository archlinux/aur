# Maintainer: ZappaBoy <zappaboydev at gmail dot com>

pkgname=dmultiwall-git
_pkgname=dmultiwall
pkgver=r17.3cac58a
pkgrel=1
pkgdesc="Dynamic multi-monitor wallpaper setter using feh"
arch=('x86_64')
url="https://github.com/ZappaBoy/dmultiwall"
license=('GPL')
depends=('bash' 'feh' 'imagemagick' 'bc')
makedepends=('git')
provides=("dmultiwall=${pkgver}")
conflicts=('dmultiwall')
source=("$_pkgname::git+https://github.com/ZappaBoy/dmultiwall.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  # Use commit count + short hash (standard for -git packages)
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 dmultiwall "$pkgdir/usr/bin/dmultiwall"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
