pkgname=('python-sphinx-renku-theme')
pkgver=0.4.0
pkgrel=1
pkgdesc='Sphinx theme for Renku documentation'
arch=('any')
url='https://github.com/SwissDataScienceCenter/renku-sphinx-theme'
license=('Apache')
depends=('python-sphinx_rtd_theme')
makedepends=('python-setuptools')
source=("https://github.com/SwissDataScienceCenter/renku-sphinx-theme/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bedf0d7719dcbfb4e2e36be13dadf6ba9783725512dd3e3ee56069fc21b5a60e')

build() {
  cd $srcdir/renku-sphinx-theme-$pkgver
  python setup.py build
}

package() {
  cd renku-sphinx-theme-$pkgver
  python setup.py install --root $pkgdir --optimize=1
}
