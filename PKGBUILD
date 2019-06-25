# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=github-backup
pkgver=0.23.0
pkgrel=1
pkgdesc="Backup a github user or organization."
arch=(any)
url="https://github.com/josegonzalez/python-github-backup"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/g/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('be991fbc4fdace0438235f0ce6a1d11ef1e4d1a6340b87d79e5f8fd5b0e75ea55cfbd3bc4fb385b352a447c0ae7aa4651682d29cdf96a63a4490a83b0ab1d124')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

