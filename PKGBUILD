# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>

pkgname=beancount-reds-plugins
pkgdesc='Miscellaneous plugins for Beancount double entry accounting'
pkgver=0.3.0
pkgrel=1
url='https://github.com/redstreet/beancount_reds_plugins/'
license=('GPL3')
arch=('any')

depends=('beancount' 'python-dateutil')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')

source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz"
)
sha256sums=(
  'deec76e1d853854fdbff1cf78a39938390ca18554a6cab21a1845ec293e58673'
)

build() {
    cd "${pkgname//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/${pkgname//-/_}-$pkgver-"*.whl
}
