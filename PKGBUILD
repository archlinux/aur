# Maintainer: Arun Mahapatra <arun@codito.in>

pkgname=python-tabula
pkgver=1.0.0
pkgrel=1
pkgdesc='Simple wrapper for tabula, read tables from PDF into DataFrame'
url="https://github.com/chezou/tabula-py"
license=('MIT')
arch=('any')
provides=('python-tabula')
makedepends=('python-setuptools')
depends=('java-runtime' 'python' 'python-pandas' 'python-requests' 'python-numpy')
sourcename="tabula-py"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('24db1a2df9c247a4fd1523849870e0880c0c1d28099799fedb8d3a520b08dd397282147d4de7ce353ce82d884271c61b4bcfe01dae95b9ed38b804ec3f6be063')

prepare() {
  cd "${srcdir}/${sourcename}-${pkgver}"
}

package() {
  cd "${srcdir}/${sourcename}-${pkgver}"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
