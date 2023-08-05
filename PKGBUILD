# imported from AUR: Bipin Kumar <kbipinkumar@pm.me>

pkgname=nanomath
pkgver=1.0.1
pkgrel=1
pkgdesc="simple math function for other Oxford Nanopore processing scripts"
url="https://github.com/wdecoster/nanomath/"
depends=(
         'python'
         'python-pandas'
         'python-numpy'
         'python-deprecated'
        )

makedepends=(
             'python-setuptools'
             'python-wheel'
             'python-build'
             'cython'
             'python-installer'
            )
license=('GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wdecoster/nanomath/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('509264d5e710eec10b7de871b30be659e2e8938f6d0333e2c82982e354049351')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm ${pkgdir}/usr/LICENSE
}
