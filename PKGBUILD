# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=pingparsing
pkgver=1.0.3
pkgrel=1
pkgdesc='Parser and transmitter for ping command'
arch=('any')
url='https://github.com/thombashi/pingparsing'
license=('MIT')
depends=('python' 'python-humanreadable' 'python-pyparsing' 'python-subprocrunner' 'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a935023a5def02cf16e9e61990bcd895ea988677718bb242646c2db05150ae38')

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
