# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Jan Fader <jan.fader@web.de>
pkgname=keynav
pkgver=0.20180821.0
# author hasn't done any releases in years
_commit="78f9e076"
pkgrel=2
pkgdesc="Ingenious and fast way to move the mouse pointer on the screen with keystrokes."
url="https://www.semicomplete.com/projects/keynav/"
license=('BSD')
arch=('x86_64')
depends=('cairo' 'xdotool' 'libxrandr')
makedepends=('git' 'perl')
#source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/semicomplete/keynav-$pkgver.tar.gz")
#source=("https://deb.debian.org/debian/pool/main/k/keynav/keynav_$pkgver.orig.tar.gz")
source=("git+https://github.com/jordansissel/keynav#commit=$_commit")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make keynav
  make keynav.1
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 keynav    "$pkgdir/usr/bin/keynav"
  install -Dm644 keynavrc  "$pkgdir/etc/keynavrc"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/keynav/COPYRIGHT"
  install -Dm755 keynav.1  "$pkgdir/usr/share/man/man1/keynav.1"
}

# vim:set ts=2 sw=2 et:
