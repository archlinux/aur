# Maintainer: piernov <piernov@piernov.org>

pkgname=python-ipython-autotime
_pkgname=${pkgname#python-}
pkgver=0.3.2
pkgrel=1
pkgdesc="Time everything in IPython"
arch=('any')
url="https://github.com/cpcloud/ipython-autotime"
license=('APACHE')
depends=('ipython')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('1062df3b105257f515a97ff830f8603130abfba5e6dbef05aabaef521d5b2a5db8923e7418a686bf3f7e4ca8526d63f10780994486534166d9b089cf6ef5f6ab')

build() {
  cd ipython-autotime-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ipython-autotime-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
