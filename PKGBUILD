# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=home-assistant-cli
pkgver=0.6.0
pkgrel=1
pkgdesc="Work with a local or a remote Home Assistant instance directly from the command-line."
arch=('any')
url='https://github.com/home-assistant/home-assistant-cli'
license=('Apache')
depends=('python-tabulate' 'python-idna' 'python-jsonpath-rw' 'python-click-log')
makedepends=('python-setuptools')
checkdepends=('python')
source=("https://github.com/home-assistant/home-assistant-cli/archive/${pkgver}.tar.gz")
sha256sums=('7713b54b3545ba5805b264bd770c5ab8f263dd4fcc7ae1ee47b788f5026ea9b1')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
