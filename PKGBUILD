# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=packagecore
pkgver=0.9.13
pkgrel=1
pkgdesc="Utility for building distribution specific Linux packages."
arch=(any)
url="https://github.com/BytePackager/packagecore"
license=(GPL2)
depends=(python)
makedepends=('python-setuptools')
provides=('packagecore-git')
conflicts=('packagecore-git')
source=("https://files.pythonhosted.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('eb7e4e96dbf4169e47afa20145d1dca9')
sha256sums=('a105e9692f250e71e7211d14ce838976f897fee927c47a26b16d35459b7ac7f5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build --single-version-externally-managed
}
