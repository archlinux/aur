# Maintainer: M0Rf30

_pkgsrcname=txrudp
pkgname=python2-${_pkgsrcname}
pkgver=0.5.1
pkgrel=3
pkgdesc="A Twisted extension implementing RUDP"
url="https://pypi.python.org/pypi/txrudp"
license=("MIT")
arch=("any")
depends=('python2' 'python2-twisted' 'python2-protobuf')
source=("https://pypi.python.org/packages/source/t/${_pkgsrcname}/txrudp-$pkgver.tar.gz")

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver

msg2 "Use python2-protobuf3-coex requirements"
  find . -type f -exec sed -i 's/google.protobuf/google.protobuf3/g' {} +     

  python2 setup.py install --root $pkgdir
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests/
}

md5sums=('a21fe7ba3fd595b89355f5392be049e5')
