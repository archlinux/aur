# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=python2-glanceclient-openstack
_pkgname=python-glanceclient
pkgver=0.14.1
pkgrel=1
pkgdesc="OpenStack image service client libs"
arch=(any)
url=https://launchpad.net/glance
license=(custom)
depends=('python2-greenlet>=0.3.2'
         'python2-sqlalchemy>=0.7.8'
         'python2-sqlalchemy<0.9.99'
         'python2-anyjson>=0.3.3'
         'python2-eventlet>=0.13.0'
         'python2-paste-deploy>=1.5.0'
         'python2-paste'
         'python2-routes>=1.12.3'
         'python2-webob>=1.2.3'
         'python2-wsgiref>=0.1.2'
         'python2-migrate-icehouse>=0.7.2'
         'python2-httplib2'
         'python2-kombu>=2.4.8'
         'python2-crypto>=2.6'
         'python2-iso8601>=0.1.8'
         'python2-lxml>=2.3'
         'python2-passlib'
         'python2-netaddr'
         'python2-sendfile'
         'python2-xattr')
makedepends=(python2-setuptools)
source=(https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('1e629e5300f11562da8b1ea09e5c1311')

prepare() {
    find ${_pkgname}-$pkgver -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

build() {
    cd ${_pkgname}-$pkgver/
    python2 setup.py build
}

package() {
    cd ${_pkgname}-$pkgver/
    python2 setup.py install --root="$pkgdir"
}
