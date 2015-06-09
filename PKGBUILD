# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
#Based on automatically generated PKGBUILD 
#by pip2arch on 2014-07-15
#https://github.com/bluepeppers/pip2arch/

pkgname=deimos
pkgver=0.4.0
pkgrel=1
pkgdesc="Mesos containerization hooks for Docker"
url="https://github.com/mesosphere/deimos"
depends=('python2')
optdepends=('mesos' 'docker')
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ec4211860b33a363d3b5323db884bcc0')

build() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1 
    sed -i -e '1 s$/usr/bin/env python$#!/usr/bin/python2$' $pkgdir/usr/lib/python2.7/site-packages/deimos/__init__.py
}
