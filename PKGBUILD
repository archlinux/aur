pkgbase=sentinels
pkgname=('python-sentinels' 'python2-sentinels')
pkgver=0.0.6
pkgrel=1
pkgdesc='Various objects to denote special meanings in python'
url='https://github.com/vmalloc/sentinels'
arch=('x86_64' 'i686')
license=('custom')
makedepends=('python2' 'python')
checkdepends=('python2-nose' 'python-nose')
source=("$pkgbase.tar.gz::https://github.com/vmalloc/sentinels/archive/$pkgver.tar.gz")
md5sums=('3c4080812aa8e97082afab9b2cc2eae4')

package_python-sentinels() {
  cd $pkgbase-$pkgver/
  depends=('python-six')
  python setup.py install --root=${pkgdir} --optimize=1

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname
}

package_python2-sentinels() {
  depends=('python2-six')
  cd $pkgbase-$pkgver/
  python2 setup.py install --root=${pkgdir} --optimize=1

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname
}
