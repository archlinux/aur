# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>
pkgname=python-google-trans-new
_name=google_trans_new
pkgver=1.1.9
pkgrel=1
pkgdesc='A free and unlimited python tools for google translate api.'
arch=(any)
url=https://pypi.org/project/google-trans-new
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9f6643420334cc1b94ebd84e03774736e76c0564208efb1bc9c5019b9820e19b')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
