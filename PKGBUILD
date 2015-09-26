pkgbase=mongomock
pkgname=('python-mongomock' 'python2-mongomock')
pkgver=3.1.0
pkgrel=1
pkgdesc='Small library for mocking pymongo collection objects for testing purposes'
url='https://github.com/vmalloc/mongomock'
arch=('x86_64' 'i686')
license=('custom')
makedepends=('python2' 'python')
source=("$pkgbase.tar.gz::https://github.com/vmalloc/mongomock/archive/$pkgver.tar.gz")
md5sums=('bdefef35f310ed4f230dd854a7d402c7')

package_python-mongomock() {
  depends=('python-six' 'python-sentinels' 'python-mock')

  cd $pkgbase-$pkgver/
  python setup.py install --root=${pkgdir} --optimize=1

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname
}

package_python2-mongomock() {
  depends=('python2-six' 'python2-sentinels' 'python2-mock')

  cd $pkgbase-$pkgver/
  python2 setup.py install --root=${pkgdir} --optimize=1

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname
}
