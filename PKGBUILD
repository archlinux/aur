# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='jtbl'
pkgver=1.1.6
pkgrel=1
pkgdesc='Simple cli tool to print JSON and JSON Lines data as a table in the terminal'
arch=('any')
url='https://github.com/kellyjonbrazil/jtbl'
_url_pypi='https://pypi.org/project/jtbl'
license=('MIT')
depends=('python-tabulate')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3623d4942b80bbd9f64c2f672c52862dad7e0d1245094a2416f04a09773b8660')

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
