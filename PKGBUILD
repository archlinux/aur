# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pysorter
pkgver=0.4.4
pkgrel=1
pkgdesc='A command line utility for organizing files and directories according to regex patterns'
arch=('any')
url='https://github.com/chriscz/pysorter'
license=('MPL2')
conflicts=('pysorter-git')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chriscz/pysorter/archive/${pkgver}.tar.gz")
sha256sums=('df468cead87cd6e97049211f17c3c176b93a6a2b7171d8667ccb94b3870d03eb')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et: