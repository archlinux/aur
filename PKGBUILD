# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=pingparsing
pkgver=1.1.0
pkgrel=1
pkgdesc='Parser and transmitter for ping command'
arch=('any')
url='https://github.com/thombashi/pingparsing'
license=('MIT')
depends=('python' 'python-humanreadable' 'python-pyparsing' 'python-subprocrunner' 'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0e6e008afef9eceb3cabaf11b71383fddbd254665d05a5eca17408f41bca1bab')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
  rm -r "${pkgdir}/usr/lib/python"*'/site-packages/examples'
}

# vim: ts=2 sw=2 et:
