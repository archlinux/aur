# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='qpropgen'
pkgver=0.1.2
pkgrel=2
pkgdesc='Generate QML-friendly QObject-based C++ classes from class definition files'
arch=('any')
url='https://github.com/agateau/qpropgen'
_url_pypi='https://pypi.org/project/qpropgen'
license=('APACHE')
depends=('python-jinja' 'python-pyaml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d7745d6d25d428fde373ea3b1c9f8436e380c9bc6b9ffde3ce02a037a55ba4f6')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
