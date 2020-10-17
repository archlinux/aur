# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='nextinspace'
pkgver=1.0.2
pkgrel=1
pkgdesc='Print upcoming space-related events to your terminal'
arch=('any')
url='https://github.com/The-Kid-Gid/nextinspace'
license=('GPL3')
depends=('python-colorama' 'python-requests' 'python-tzlocal')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8e4db1e0bc51af26c3b9d9a1e2feb3c2bf0569abf59c812bc12a39de2f6f3b73')

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
