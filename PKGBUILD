# Maintainer: Zhaofeng Li <hello@zhaofeng.li>

pkgname=python-haas-proxy
pkgver=1.9
pkgrel=1
pkgdesc="A proxy server for the HaaS SSH honeypot service"
arch=('any')
url="https://haas.nic.cz/proxy/"
license=('GPL3')
depends=('python-cachetools' 'python-twisted' 'python-requests' 'python-cryptography' 'python-pyasn1' 'sshpass')
makedepends=('python-setuptools')
source=(
  "https://gitlab.labs.nic.cz/haas/proxy/raw/master/release/haas-proxy-${pkgver}.tar.gz"
)
md5sums=('087775374888bb932e87dafb220bcf16')

build() {
  cd haas-proxy-${pkgver}
  python setup.py build
}

package() {
  cd haas-proxy-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
