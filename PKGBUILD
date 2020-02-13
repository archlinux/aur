# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
#Based on automatically generated PKGBUILD 
#by pip2arch on 2014-07-15
#https://github.com/bluepeppers/pip2arch/

pkgname=deimos
pkgver=0.4.2
pkgrel=1
pkgdesc="Mesos containerization hooks for Docker"
url="https://github.com/mesosphere/deimos"
depends=('python2')
optdepends=('mesos' 'docker')
license=('Apache')
arch=('any')
source=("https://github.com/mesosphere/deimos/archive/$pkgver.tar.gz")
sha512sums=('bf9ec16798d753ca2071c8d9353e3b4cc3959519a2b554148d0d1fe8777a60b96af185f80fbb5c3765c70887f1f6f04c82538faf6f93782dc16aac31a00aa26d')

build() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1 
    sed -i -e '1 s$/usr/bin/env python$#!/usr/bin/python2$' $pkgdir/usr/lib/python2.7/site-packages/deimos/__init__.py
}
