# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgbase=isrcsubmit-git
pkgname=$pkgbase
pkgver=2.0.0.beta.4.4.g2fd25e2
pkgver(){
  cd $srcdir/$pkgbase
  git describe --tags --long | sed 's/-/./g;s/^v//'
}
pkgrel=1
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="https://github.com/JonnyJD/musicbrainz-isrcsubmit"
license=('GPL3')
depends=('python' 'python-musicbrainzngs>=0.4' 'python-discid>=1.0.0')
makedepends=('git' 'python-distribute')
provides=('isrcsubmit')
conflicts=('isrcsubmit')
replaces=('isrcsubmit-python2-git' 'isrcsubmit-python-git')
options=(!emptydirs)
source=($pkgbase::git+https://github.com/JonnyJD/musicbrainz-isrcsubmit.git)
md5sums=('SKIP')

build() {
  cd $pkgbase
  python setup.py build
}

package() {
  cd $srcdir/$pkgbase
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
