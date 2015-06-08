# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=upnp-inspector-svn
pkgver=r1676
pkgrel=1
pkgdesc="UPnP Device and Service analyzer"
arch=('any')
url="https://coherence.beebits.net/"
license=('MIT')
depends=('python2' 'coherence' 'pygtk')
provides=('upnp-inspector')
conflicts=('upnp-inspector')
makedepends=('setuptools' 'subversion')
source=("$pkgname"::'svn+https://coherence.beebits.net/svn/trunk/UPnP-Inspector')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --prefix=/usr --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
