pkgname=python-mingw-ldd
pkgver=0.2.1
pkgrel=1
pkgdesc="Lists dependencies of a PE (exe/dll) file"
arch=(any)
url="https://github.com/nurupo/mingw-ldd"
license=(MIT)
depends=(python-pefile)
makedepends=(python-setuptools python-pip)
source=(https://github.com/nurupo/mingw-ldd/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('60d34506d2f345e011b88de172ef312f37ca3ba87f3764f511061b69878ab204')

package() {
  cd mingw-ldd-${pkgver}
  pip install . --prefix=/usr --root="${pkgdir}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/mingw-ldd"
}
