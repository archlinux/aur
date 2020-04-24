# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=home-assistant-cli
pkgver=0.9.1
pkgrel=1
pkgdesc="Work with a local or a remote Home Assistant instance directly from the command-line."
arch=('any')
url='https://github.com/home-assistant/home-assistant-cli'
license=('Apache')
depends=('python-tabulate' 'python-idna' 'python-jsonpath-rw' 'python-click-log' 'python-aiohttp' 'python-regex' 'python-netdisco' 'python-dateparser')
makedepends=('python-setuptools')
checkdepends=('python-coverage' 'python-wheel')
source=("https://github.com/home-assistant/home-assistant-cli/archive/${pkgver}.tar.gz")
sha256sums=('8487bb440872c57c5684e40b1f0c3771045ea9ced11749f0d38aefec14d1a163')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
