# Maintainer: robertfoster

pkgname=python-unoserver
pkgver=1.2
pkgrel=2
pkgdesc="Using LibreOffice as a server for converting documents"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/unoconv/unoserver"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz"
  disable-user-installation.patch
)

prepare() {
  cd ${pkgname##python-}-$pkgver
  patch -Np1 -i ../disable-user-installation.patch
}

package() {
  cd ${pkgname##python-}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('7fd2190d8d57b90aacbf0ce9b22265e56f7c1512e3f63e75f36e3449e48e7b5f'
  'f5d0bd0eecd98a6159abe56cf943ebf3837d0d58eab56c912e00e6bd3887bfbf')
