# Maintainer: Luis Martinez <luis at martinez at tuta dot io>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jello
pkgver=1.4.0
pkgrel=1
pkgdesc='Filter JSON and JSON Lines data with Python syntax'
arch=('any')
url='https://github.com/kellyjonbrazil/jello'
license=('MIT')
depends=('python-pygments')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f1baae99d247628d823659856fa6e734194ad7b4733b7f14fc8607f6f5be06f9')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
