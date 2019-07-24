# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=github-backup
pkgver=0.25.0
pkgrel=1
pkgdesc="Backup a github user or organization."
arch=(any)
url="https://github.com/josegonzalez/python-github-backup"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/g/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('755238b180f1212ee8ac35bcf6a45fdb830556a15ad39c5b0b4d204f0c7d91eabd07a6a5036fa8c322dcf18377edb59d6a3a0d299cf75d62df38be14e10f0a98')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

