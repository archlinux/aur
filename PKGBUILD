# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=(python2-dulwich)
pkgver=0.19.11
pkgrel=1
pkgdesc='Pure-Python implementation of the Git file formats and protocols'
arch=('any')
url='https://www.dulwich.io/'
license=('GPL2')
depends=()
makedepends=('python2')
options=(!emptydirs)
source=("https://github.com/jelmer/dulwich/archive/dulwich-${pkgver}.tar.gz")
md5sums=('9d6b91f14e73f55d5fd69b0fe850bb2d')

build() {
  cd "dulwich-dulwich-${pkgver}"
  python2 setup.py build
}

package_python2-dulwich() {
  depends=('python2')
  cd "dulwich-dulwich-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
  mv "${pkgdir}"/usr/bin/dulwich{,2}
  mv "${pkgdir}"/usr/bin/dul-receive-pack{,2}
  mv "${pkgdir}"/usr/bin/dul-upload-pack{,2}
}

# vim:set ts=2 sw=2 et:
