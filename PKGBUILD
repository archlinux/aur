# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=home-assistant-cli
pkgver=0.7.0
pkgrel=1
pkgdesc="Work with a local or a remote Home Assistant instance directly from the command-line."
arch=('any')
url='https://github.com/home-assistant/home-assistant-cli'
license=('Apache')
depends=('python-tabulate' 'python-idna' 'python-jsonpath-rw' 'python-click-log')
makedepends=('python-setuptools')
checkdepends=('python')
source=("https://github.com/home-assistant/home-assistant-cli/archive/${pkgver}.tar.gz")
sha256sums=('a7c57cd07736a293ccb46a47e40ef9e44f526d64d8debee46cd8f402bb9e5659')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
