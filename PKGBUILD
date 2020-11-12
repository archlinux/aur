# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-requests-ftp'
pkgver=0.3.1
pkgrel=5
pkgdesc="FTP transport adapter for Requests"
arch=('any')
url="https://github.com/Lukasa/requests-ftp"
license=('Apache')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://github.com/Lukasa/requests-ftp/archive/v${pkgver}.tar.gz")
sha256sums=('9e63cf0f21d306931e205363fb5021f9553c8fcc0197bac07f0882a56d8e7251')

build() {
  cd "$srcdir"/requests-ftp-${pkgver}

  python setup.py build_ext --inplace
  python setup.py build
}

package() {
  cd "$srcdir"/requests-ftp-${pkgver}

  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
