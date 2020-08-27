# Maintainer: Philipp Classen <philipp at posteo.de>
# Contributor: Arnaud Durand-Favreau <biginoz at FREE point FR>
# Previous maintainer: Bjoern Franke <bjo at nord-west.org>
pkgname=stapler
pkgver=1.0.0
pkgrel=4
pkgdesc="A small utility making use of the pypdf library to provide a (somewhat) lighter alternative to pdftk"
arch=('any')
url="https://github.com/hellerbarde/stapler"
license=('BSD')
depends=('python' 'python-pypdf2' 'python-more-itertools')
makedepends=('python-pip')
conflicts=('stapler-git')

source=("https://github.com/hellerbarde/stapler/archive/$pkgver.tar.gz")
sha256sums=('011f0d82a1c7a20a600a8dbe4fb3076129ec1df3a2214054ae7954ab3a85ed51')

package() {
  cd $srcdir/$pkgname-$pkgver
  pip install --no-deps \
      --no-warn-script-location \
      --root="$pkgdir" --isolated \
      --compile -I .
  rm -f "$pkgdir/usr/bin/pdf-stapler" # Same as stapler.

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/stapler/LICENSE
  install -Dm644 README.rst $pkgdir/usr/share/doc/stapler/README
}
