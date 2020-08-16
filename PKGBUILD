# Maintainer: Mathieu Clabaut <mathieu@clabaut.net>
# Contributor: flu
pkgname=mopidy-qsaver-git
pkgver=17
pkgrel=2
pkgdesc="Mopidy extension that maintains your current tracklist when the
server restarts"
arch=('any')
url="https://github.com/HeadspringLabs/mopidy-qsaver"
license=('APACHE')
depends=('mopidy>=1.0.5' )
makedepends=('python3')
source=("git+https://github.com/HeadspringLabs/mopidy-qsaver.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mopidy-qsaver"
  git rev-list --count HEAD
}
package() {
  cd "$srcdir/mopidy-qsaver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
