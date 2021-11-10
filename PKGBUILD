# Maintainer: Victrid <weihau.chiang@gmail.com>
_pkgname=ryu
pkgname=python-$_pkgname
pkgver=4.34
pkgrel=1
pkgdesc="Component-based Software-defined Networking Framework"
arch=('any')
url="https://ryu-sdn.org"
license=('APACHE')
depends=('python' 'python-eventlet' 'python-msgpack' 'python-netaddr' 'python-oslo-config' 'openvswitch' 'python-packaging' 'python-routes' 'python-six' 'python-tinyrpc' 'python-webob')
makedepends=('git' 'python-setuptools' 'python-pip')
source=("https://github.com/faucetsdn/ryu/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("SKIP")

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    
    #Fix the strange /usr/etc
    mv "$pkgdir/usr/etc" "$pkgdir/etc"
}

# vim:set ts=2 sw=2 et:
 
