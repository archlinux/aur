# Maintainer: spacechicken <spacechicken at aur>
pkgname=fuck
pkgver=3.32
pkgrel=4
pkgdesc="Magnificent app which corrects your previous console command - with improved Arch Linux package prediction"
arch=('any')
url="https://github.com/RonanHevenor/fuck"
license=('MIT')
depends=(
  'python'
  'python-colorama'
  'python-decorator'
  'python-psutil'
  'python-pyte'
  'python-six'
)
makedepends=(
  'python-setuptools'
)
optdepends=(
  'pkgfile: better binary-to-package lookup'
)
provides=('thefuck')
conflicts=('thefuck')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/RonanHevenor/fuck/archive/refs/heads/master.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/fuck-master"
  python setup.py build
}

package() {
  cd "${srcdir}/fuck-master"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
