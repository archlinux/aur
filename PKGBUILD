# $Id: PKGBUILD 128964 2015-03-09 08:14:16Z mtorromeo $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-augeas
pkgver=1.0.1
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

package() {
    cd "$srcdir/python-augeas-$pkgver"
    python setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('d9b5dfc920a16ddf213b30539496b3b0c3a5e80abc3a18cb933a5ae731883312')
