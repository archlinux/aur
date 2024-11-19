# Maintainer: Victor Lavaud <victor.lavaud@pm.me>
pkgname=python-vinetto
pkgver=0.9.12
pkgrel=1
pkgdesc="A forensics tool to examine Thumbs.db files"
arch=('any')
url="https://github.com/AtesComp/Vinetto"
license=('GPL3')
makedepends=('python-setuptools')
source=("python-vinetto-${pkgver}.tar.gz::https://github.com/AtesComp/Vinetto/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e4a2e2a0ad7c48bc86be480bc2271e939af6afe765907c44eb2ca56c734121b9')
depends=('python-pillow>=9.0.0' 'libesedb')

build() {
  cd "Vinetto-${pkgver}"
  python setup.py build
}

package() {
  cd "Vinetto-${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
