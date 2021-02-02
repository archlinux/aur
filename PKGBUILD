# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
# Contributor: Mathieu Clabaut <mathieu@clabaut.net>
# Contributor: flu
pkgname=mopidy-qsaver-git
pkgver=latest
pkgrel=1
pkgdesc="Mopidy extension that maintains your current tracklist when the
server restarts"
arch=('any')
url="https://github.com/seifferth/mopidy-qsaver"
license=('APACHE')
depends=('mopidy>=1.0.5' )
makedepends=('python3')
source=("git+https://github.com/seifferth/mopidy-qsaver.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mopidy-qsaver"
  git rev-list --count HEAD
}
package() {
  cd "$srcdir/mopidy-qsaver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
