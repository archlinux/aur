pkgname=python2-qprogedit
pkgver=2.1.0
pkgrel=1
pkgdesc="PyQt4 widget that implements a full-featured text editor"
arch=('i686' 'x86_64')
url="https://github.com/smathot/QProgEdit"
license=('GPL3')
depends=('python2-pyqt4' 'python2-qscintilla')
makedepends=('git')
provides=('python2-qprogedit')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git://github.com/smathot/QProgEdit.git#tag=release/2.1.0')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')


build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
