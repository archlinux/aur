# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=transifex-client-beta
pkgver=0.11.1
pkgrel=1
pkgdesc="The Transifex command-line tool to download and upload translations from Transifex (beta version)"
arch=('any')
url="https://github.com/transifex/transifex-client"
license=('GPL2')
depends=('python2' 'python2-distribute')
conflicts=('transifex-client')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/transifex/${pkgname%-*}/archive/${pkgver}-beta.tar.gz")
sha256sums=('f93bc7069ed9259f805cdd40e3ec55102fbfeb2e1b2a22b544a31e682d546859')

build() {
  cd "${pkgname%-*}-${pkgver}-beta"
  python2 setup.py build
}

package() {
  cd "${pkgname%-*}-${pkgver}-beta"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
