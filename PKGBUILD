# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=('python-raet' 'python2-raet')
pkgver=0.6.8
pkgrel=1
pkgdesc='Asynchronous encrypted transaction based protocol using Ioflo'
arch=('any')
url='http://raet.docs.saltstack.com/'
license=('APACHE')
makedepends=(python-setuptools python2-setuptools)
source=("https://pypi.io/packages/source/r/raet/raet-$pkgver.tar.gz")
sha512sums=('01279e7414ec3edc9f2bc0641cb9e0606ebf5700b5ce37a05fd5919f3274b3b43aad64110baf4c4b1fda3843cb1a87b6be4ab592a8f62e82b3a716a86ae61b20')

prepare() {
  cd $srcdir
  cp -r raet-$pkgver python2-raet-$pkgver
}

package_python-raet() {
  depends=('python-libnacl' 'python-ioflo' 'python-six')
  cd "$srcdir/raet-$pkgver"
  python3 setup.py install --root="$pkgdir" -O1
}

package_python2-raet() {
  depends=('python2-libnacl' 'python2-ioflo' 'python2-six' 'python2-enum34')
  cd "$srcdir/python2-raet-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
  mv "$pkgdir/usr/bin/raetflo"{,2}
}
