# Maintainer: ZappaBoy <zappaboydev at gmail dot com>

pkgname=dmultiwall-git
_pkgname=dmultiwall
pkgver=1.0.0.r0.g11d5841
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

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 dmultiwall "$pkgdir/usr/bin/dmultiwall"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
