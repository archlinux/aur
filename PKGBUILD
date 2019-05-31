# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=github-backup
pkgver=0.22.2
pkgrel=1
pkgdesc="Backup a github user or organization."
arch=(any)
url="https://github.com/josegonzalez/python-github-backup"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/g/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2d95d1444bf9c27998f11d52130ac7e8f025cb8049fa7c86461bb7f0881faf179c1bb3cb4591d0d9fbfccb8761b6d46de42f3d38acb637f047f4a85e2aafae5a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

