# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=(python2-dulwich python-dulwich)
pkgver=0.18.3
pkgrel=1
pkgdesc='Pure-Python implementation of the Git file formats and protocols'
arch=('any')
url='https://www.dulwich.io/'
license=('GPL2')
depends=()
options=(!emptydirs)
source=("https://www.dulwich.io/releases/dulwich-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ
sha256sums=('d34c2628f89a5ac632fa462b2edd5afcfbf512793cfa14452d4c52f786962a8a'
            'SKIP')

build() {
  cd "dulwich-${pkgver}"
  python2 setup.py build
  python setup.py build
}

package_python-dulwich() {
  depends=('python')
  conflicts=('python2-dulwich')
  cd "dulwich-${pkgver}"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

package_python2-dulwich() {
  depends=('python2')
  conflicts=('python-dulwich')
  cd "dulwich-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

# vim:set ts=2 sw=2 et:
