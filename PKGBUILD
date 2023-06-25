# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=azure-monitor-ingestion
pkgname=python-$_name
pkgver=1.0.2
pkgrel=1
pkgdesc="Microsoft Azure Monitor Ingestion Client Library for Python"
arch=(any)
url="https://pypi.org/project/azure-monitor-ingestion/"
license=('MIT')
depends=('python-azure-core'
         'python-isodate'
         'python-typing-extensions')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.zip")
md5sums=('23e8ba1b07676a100c6d606d2d668fc3')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
