# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=transifex-client-git
pkgver=0.11.1.beta
pkgrel=1
pkgdesc="The Transifex command-line tool to download and upload translations from Transifex (development version)"
arch=('any')
url="http://pypi.python.org/pypi/transifex-client"
license=('GPL2')
depends=('python2' 'python2-distribute')
makedepends=('git')
provides=('transifex-client')
conflicts=('transifex-client' 'transifex-client-beta')
source=("git://github.com/transifex/transifex-client.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --tags --always | sed 's|-|.|g'
}

build() {
  cd "${pkgname%-*}"
  python2 setup.py build
}

package() {
  cd "${pkgname%-*}"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
