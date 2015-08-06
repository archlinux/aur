# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=python2-simple-crypt
pkgver=4.1.7
pkgrel=1
arch=('any')
license=('custom')
pkgdesc="Simple, secure encryption and decryption for Python 2.7"
url="https://pypi.python.org/pypi/simple-crypt"
makedepends=('python-distribute')
depends=('python-crypto')
source=("https://pypi.python.org/packages/source/s/simple-crypt/simple-crypt-$pkgver.tar.gz" 
		"LICENSE")
md5sums=('dc2b13ce6be9c9da08fb1e7d83498882'
         'e6208ad8f3763a8fd68f263ca0363732')

build() {
  cd "$srcdir/simple-crypt-$pkgver"
  ls
  python2 setup.py build
}

package() {
  cd "$srcdir"
  ls
  # Install public domain license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/" 
  cd "simple-crypt-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1
}
