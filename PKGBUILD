# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=packagecore
pkgver=0.11.1
pkgrel=1
pkgdesc="Utility for building distribution specific Linux packages."
arch=(any)
url="https://github.com/BytePackager/packagecore"
license=(GPL2)
depends=(python)
makedepends=('python-setuptools')
provides=('packagecore-git')
conflicts=('packagecore-git')
source=("https://github.com/BytePackager/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('1e6175244527c777f55b2cf946e27a0c')
sha256sums=('4982aa26b092afcffbfb3fe69ebabe386e9d4b34dde4365b5e69278a43a2aa4e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build --single-version-externally-managed
}
