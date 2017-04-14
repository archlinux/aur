# $Id: PKGBUILD 128964 2015-03-09 08:14:16Z mtorromeo $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-augeas
pkgver=1.0.2
pkgrel=1
pkgdesc="Pure python bindings for augeas"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://augeas.net"
depends=(augeas python python-cffi)
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/hercules-team/python-augeas/archive/v$pkgver.tar.gz")

build() {
    cd "$srcdir/python-augeas-$pkgver"
    python setup.py build
}

check() {
    cd "$srcdir/python-augeas-$pkgver"
    # https://github.com/hercules-team/python-augeas/pull/24
    # python test/test_augeas.py
}

package() {
    cd "$srcdir/python-augeas-$pkgver"
    python setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('3c3ee1472d0614444c5c13001524ca2964594b557745ee5f094bce6fc3a367a4')
