# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='termtrack'
pkgver=0.7.3
pkgrel=1
pkgdesc='Track satellites in your terminal'
arch=('any')
url='https://github.com/trehn/termtrack'
license=('GPL3')
depends=('python-click' 'python-pillow' 'python-pyephem' 'python-pyshp' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f2aaad8d7675b84b59e0d1d3dfd584f15843b9fa8c8a3c9ebecd4511fc93625c')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.rst'
}

# vim: ts=2 sw=2 et:
