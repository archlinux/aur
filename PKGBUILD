# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=(python2-dulwich python-dulwich)
pkgver=0.18.5
pkgrel=1
pkgdesc='Pure-Python implementation of the Git file formats and protocols'
arch=('any')
url='https://www.dulwich.io/'
license=('GPL2')
depends=()
options=(!emptydirs)
source=("https://github.com/jelmer/dulwich/archive/dulwich-${pkgver}.tar.gz")


build() {
  cd "dulwich-dulwich-${pkgver}"
  python2 setup.py build
  python setup.py build
}

package_python-dulwich() {
  depends=('python')
  conflicts=('python2-dulwich')
  cd "dulwich-dulwich-${pkgver}"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

package_python2-dulwich() {
  depends=('python2')
  conflicts=('python-dulwich')
  cd "dulwich-dulwich-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

# vim:set ts=2 sw=2 et:

md5sums=('d20dbdb2ec7a1ae6570bb446cce70f7b')
