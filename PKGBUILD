# Maintainer: flu
# Contributor: Guten Ye

_name="diana"
pkgname="$_name-git"
pkgver=20140126.59 
pkgrel=1
pkgdesc="A command line interface to the aria2 daemon "
arch=("any")
url="https://github.com/baskerville/diana"
license=("unknown")
depends=("aria2" "python")
makedepends=("git")
provides=("$_name")
conflicts=("$_name")
source=(git://github.com/baskerville/diana)
sha512sums=(SKIP)

pkgver() {
  cd   "$srcdir/$_name"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

package() {

  cd                   "$srcdir/$_name"
  mkdir   -p           "$pkgdir/usr/bin/"

  install -Dm755 dad   "$pkgdir/usr/bin/"
  install -Dm755 diana "$pkgdir/usr/bin/"
}
