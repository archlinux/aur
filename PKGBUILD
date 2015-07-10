# Contributor: Gour <gour@gour-nitai.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=bibstuff  
pkgver=1.3.1
pkgrel=1
pkgdesc="Collection of python2 scripts and modules for interacting with BibTeX style databases of citation references"
url="http://dschwilk.github.io/bibstuff"
arch=('any')
license=('MIT')
depends=('python2')
source=(bibstuff.zip::https://github.com/dschwilk/bibstuff/archive/master.zip)
md5sums=('4d89e8356f99456adae34aeede5af79b')

package() {
  cd $srcdir/$pkgname-master
  python2 setup.py install --root=$pkgdir

  # copying license information
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt

  # copying readme information
  install -Dm644 README.rst $pkgdir/usr/share/doc/$pkgname/README.rst

  # copying examples directory
  install -d $pkgdir/usr/share/doc/$pkgname/examples
  cp examples/* $pkgdir/usr/share/doc/$pkgname/examples
  sed -i '1s+python+python2+' $pkgdir/usr/share/doc/bibstuff/examples/jmaker.py
}
