# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=packagecore
pkgver=0.11.2
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
md5sums=('b8221e28341678eeb68058ef5b567cff')
sha256sums=('1d5ed8c6ff2a2a1a255b9f38669eec5813620c02c87bf30e80cdcd7e8be50ee7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build --single-version-externally-managed
}
