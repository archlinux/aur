pkgname=python-potr-git
_pkgname=pure-python-otr
pkgrel=1
pkgver=20150128.8ba4981
pkgdesc="A pure python implementation of the OTR encryption protocol. GIT version."
arch=(any)
url="http://github.com/python-otr/pure-python-otr"
license=('LGPL')
depends=('python2' 'python2-crypto')
makedepends=('git')
provides=('python-potr')
conflicts=('python-potr')

md5sums=('SKIP')
source=('git://github.com/python-otr/pure-python-otr.git')

build() {
  cd "$srcdir/$_pkgname"
  python3 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python3 setup.py install --root=$pkgdir/
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd.%h' --date=short | tr -d - | sed 's/-/./'
}
# vim:set ts=2 sw=2 et:
