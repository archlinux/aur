# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=home-assistant-cli
pkgver=0.9.0
pkgrel=1
pkgdesc="Work with a local or a remote Home Assistant instance directly from the command-line."
arch=('any')
url='https://github.com/home-assistant/home-assistant-cli'
license=('Apache')
depends=('python-tabulate' 'python-idna' 'python-jsonpath-rw' 'python-click-log' 'python-aiohttp' 'python-regex' 'python-netdisco' 'python-dateparser')
makedepends=('python-setuptools')
checkdepends=('python-coverage' 'python-wheel')
source=("https://github.com/home-assistant/home-assistant-cli/archive/${pkgver}.tar.gz")
sha256sums=('c32d10a71aff1a92cc5c9e9cf5a5293723a43c70aa0db33868acb175cbb05f11')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
