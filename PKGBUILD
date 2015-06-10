# Contributor: Sergio Tridente <tioduke@gmail.com>

pkgname=pyncrypt
pkgver=0.6.4
pkgrel=3
pkgdesc="PyNCrypt: Yet another OpenSSL wrapper for python"
arch=('i686' 'x86_64')
license=('GPL')
url="http://tachyon.in/ncrypt"
depends=('python2' )
makedepends=('pyrex')
source=(http://fs.tachyon.in.s3.amazonaws.com/ncrypt/ncrypt-${pkgver}.tar.gz
        pyncrypt.patch)
md5sums=('cd1fdb07e925808d707854d171e4b6b1'
         'ce9c5accf4fb5b1908ed554a55ee9e46')

build() {
  cd $startdir/src/ncrypt-${pkgver}
  patch -Np1 -i $startdir/src/pyncrypt.patch
  python2 setup.py install --root=$startdir/pkg/
}
