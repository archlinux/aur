# Author: ZaZam <zazaamm at gmail dot com>

_gitname=spotify2musicbrainz
pkgname=spotify2musicbrainz-git
pkgver=0.3.2.r0.g2f70217
pkgrel=1
pkgdesc="Python script for importing albums on Spotify to MusicBrainz"
arch=('any')
url="https://gitlab.com/Freso/spotify2musicbrainz"
license=('GPL3')
depends=('python-musicbrainzngs' 'python-spotipy')
makedepends=('git' 'python-setuptools-scm')
source=("git+https://gitlab.com/Freso/spotify2musicbrainz")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
