# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname=pinboard
pkgver=2.1.8
pkgrel=1
pkgdesc="a full-featured Python wrapper for the Pinboard API (stable version)"
arch=('i686' 'x86_64')
url="https://github.com/lionheart/pinboard.py"
license=("Apache")
depends=("python")
provides=('pinboard')
conflicts=('pinboard-git')
makedepends=('git')
source=("git+https://github.com/lionheart/pinboard.py.git#tag=2.1.8")
md5sums=('SKIP')

package() {
  cd "${srcdir}"/pinboard.py
  python setup.py install \
      --prefix=/usr \
      --root="${pkgdir}"
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
