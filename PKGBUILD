# Maintainer: Tobias Weber <tobias dot weber at iml dot fraunhofer dot de>

pkgname=python-certsrv
pkgver=2.1.1
pkgrel=1
pkgdesc="A Python client for the Microsoft AD Certificate Services web page"
url="https://github.com/magnuswatn/certsrv"
depends=('python' 'python-requests' 'python-requests-ntlm')
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-installer')
license=('MIT')
arch=(any)
source=("https://files.pythonhosted.org/packages/b2/60/dd93f1bf29aeb5b21ee95c0706276ba420253275ba17c9cd1d6636fad276/certsrv-${pkgver}.tar.gz")
sha512sums=('9b886c2bcd4a07f8d2779b2354f9ef1f514117b30f4545147f9a6f968ed7e186695030452d4896e3dfbe37c5ab9717d8939deae6fff2507f9db0102e4c4a9b20')

build() {
  cd "${srcdir}/certsrv-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/certsrv-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

