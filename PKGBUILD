# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='nextinspace'
pkgver=1.0.0
pkgrel=1
pkgdesc='Print upcoming space-related events to your terminal'
arch=('any')
url='https://github.com/The-Kid-Gid/nextinspace'
license=('GPL3')
depends=('python-colorama' 'python-requests' 'python-tzlocal')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8ae880b5d6728657841d0866602bbf1d01bcd19b37097568192c9f7287f0f339')

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
