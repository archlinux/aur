# Maintainer: Roan Huang <pichuang@cs.nctu.edu.tw>

_pkgname=ryu
pkgname=$_pkgname-git
pkgver=v3.14
pkgrel=4
pkgdesc="Ryu component-based software defined networking framework"
arch=('i686' 'x86_64' 'armv6h')
url="http://osrg.github.io/ryu/"
license=('Apache License 2.0')
depends=('python2' 'python2-setuptools' 'python2-pip' 'python2-lxml' 'python2-greenlet' 'python2-webob' 'python2-six' 'python2-routes' 'python2-paramiko' 'python2-oslo-config' 'python2-msgpack' 'python2-netaddr' 'python2-eventlet' 'python2-pbr' 'python2-stevedore')
makedepends=('git' 'sed')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=
source=("$_pkgname::git+https://github.com/osrg/ryu.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|-|.|g'
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
