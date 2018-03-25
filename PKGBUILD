# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=transifex-client-git
pkgver=0.13.1.9.g465be63
pkgrel=1
pkgdesc="The Transifex command-line tool to download and upload translations from Transifex (development version)"
arch=('any')
url="http://pypi.python.org/pypi/transifex-client"
license=('GPL2')
depends=('python-distribute' 'python-urllib3' 'python-six' 'python-requests'
         'python-slugify')
makedepends=('git')
provides=('transifex-client')
conflicts=('transifex-client' 'transifex-client-beta')
source=("git://github.com/transifex/transifex-client.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --tags --always | sed 's|-|.|g'
}

build() {
  cd "${pkgname%-*}"
  python setup.py build
}

package() {
  cd "${pkgname%-*}"
  python setup.py install --root=${pkgdir} --optimize=1
}
