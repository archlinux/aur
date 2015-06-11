# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=('python2-stevedore-kilo')
pkgver=1.3.0
pkgrel=1
pkgdesc="Manage dynamic plugins for Python applications"
arch=('any')
url="https://github.com/dreamhost/stevedore"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
options=('!emptydirs')
provides=('python2-stevedore')
source=(http://pypi.python.org/packages/source/s/stevedore/stevedore-$pkgver.tar.gz)
sha256sums=('beab2b7f91966d259796392c39ed6f260b32851861561dd9f3b9be2fd0c426a5')

prepare() {
  cd "$srcdir/stevedore-$pkgver"
  sed -i '/argparse/d' requirements.txt
  sed -i '/pbr/d' requirements.txt
}

package_python2-stevedore-kilo() {
  depends=('python2-setuptools' 'python2-six')

  cd "$srcdir/stevedore-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
}
