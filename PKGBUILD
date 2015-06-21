# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Dmitry A. Ilyashevich <dmitry.ilyashevich@gmail.com>
pkgname=distorm
pkgver=3.3.0
pkgrel=1
pkgdesc="The ultimate disassembler (for AMD64, X86-64)"
url="http://code.google.com/p/distorm/"
license=('GPL')
depends=('python2')
arch=('i686' 'x86_64')
source=(http://distorm.googlecode.com/files/distorm3.zip)
md5sums=('2cd594169fc96b4442056b7494c09153')

package() {
    cd $srcdir/distorm3
    python2 setup.py install --root=$pkgdir/ --optimize=1

    sed -i -e '1i#!/usr/bin/python2' $srcdir/distorm3/python/distorm3/sample.py

    install -D -m755 $srcdir/distorm3/python/distorm3/sample.py $pkgdir/usr/bin/disasm
    install -D $srcdir/distorm3/COPYING $pkgdir/usr/share/licenses/distorm/COPYING
}

