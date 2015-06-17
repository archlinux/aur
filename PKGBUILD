# Maintainer: M0Rf30

pkgname=pyntk-svn
pkgver=1185
pkgrel=1
pkgdesc="Netsukuku: An experimental peer-to-peer wireless routing system, written in Python"                                                                                         
arch=('i686' 'x86_64')
url="http://netsukuku.freaknet.org"
source=('ntkd.rc'
	'ntkd.service')
license=('GPL')
depends=('stackless-python2')
makedepends=('subversion' 'python2-distribute')
provides=('pyntk')
source=("pyntk::svn+https://github.com/venugopalk/netsukuku"
	ntkd.service)

package() {
  cd pyntk/trunk/pyntk
  python2 setup.py install --root=$pkgdir
  install -Dm755 ${srcdir}/ntkd.service ${pkgdir}/usr/lib/systemd/system/ntkd.service
}

pkgver() {
  cd pyntk
  svnversion | tr -d [A-z]
}

md5sums=('SKIP'
         '2afcefb8d01dfc1f89873f04db67e098')
