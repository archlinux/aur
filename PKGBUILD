# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=python2-libjio
_pkgname=libjio
pkgver=1.02
pkgrel=1
pkgdesc="Python bindings for libjiu, a userspace library to do journaled, transaction-oriented I/O."
arch=('i686' 'x86_64')
url="https://blitiri.com.ar/p/libjio/"
license=('custom')
depends=('python2' 'libjio')
source=("https://blitiri.com.ar/p/$_pkgname/files/$pkgver/$_pkgname-$pkgver.tar.gz")
md5sums=('b9ad3f5e0cef17632aea0f0de9347225')

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd bindings/python
  python2 setup.py install --root=$pkgdir
}
