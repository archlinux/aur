# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='nextinspace'
pkgver=1.0.4
pkgrel=1
pkgdesc='Print upcoming space-related events to your terminal'
arch=('any')
url='https://github.com/The-Kid-Gid/nextinspace'
_url_pypi='https://pypi.org/project/nextinspace'
license=('GPL3')
depends=('python-colorama' 'python-requests' 'python-tzlocal')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('60f9ac837b8131ff3b996ea4eb5f4eff42c61c4810238c318cb030b430924daf')

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
