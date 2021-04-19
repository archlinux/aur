# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=packagecore
pkgver=0.11.11
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
md5sums=('53d8e7888eb1312a69d79f6aaf5d5f54')
sha256sums=('ec00824b1219e6048a9ec22f98f25b216bb05e9ae3ef5f2aafd73020bec316dc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build --single-version-externally-managed
}
