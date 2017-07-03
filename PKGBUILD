# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=(python2-dulwich python-dulwich)
pkgver=0.17.2
pkgrel=1
pkgdesc='Pure-Python implementation of the Git file formats and protocols'
arch=('any')
url='https://www.dulwich.io/'
license=('GPL2')
depends=()
options=(!emptydirs)
source=("https://www.dulwich.io/releases/dulwich-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ
sha256sums=('90b5c1025f60c68b98980f85950860b980692053c7c5dd93c19cc3cb87f186b2'
            'SKIP')

build() {
  cd "dulwich-${pkgver}"
  python2 setup.py build
  python setup.py build
}

package_python-dulwich() {
  depends=('python')
  cd "dulwich-${pkgver}"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

package_python2-dulwich() {
  depends=('python2')
  cd "dulwich-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

# vim:set ts=2 sw=2 et:
