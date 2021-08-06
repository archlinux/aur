# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=home-assistant-cli
pkgver=0.9.4
pkgrel=1
pkgdesc="Work with a local or a remote Home Assistant instance directly from the command-line."
arch=('any')
url='https://github.com/home-assistant/home-assistant-cli'
license=('Apache')
depends=('python-tabulate' 'python-idna' 'python-jsonpath-rw' 'python-click-log' 'python-aiohttp' 'python-regex' 'python-netdisco' 'python-dateparser')
makedepends=('python-setuptools')
checkdepends=('python-coverage' 'python-wheel')
source=("https://github.com/home-assistant/home-assistant-cli/archive/${pkgver}.tar.gz")
sha256sums=('0ec8b52fc3e21b3277a0d0038e1beca4b51c2d035783cca08b472cb38263c908')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
