# Maintainer: Jack Rubacha < rubacha.jack03@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='nextinspace'
pkgver=2.0.3
pkgrel=1
pkgdesc='Print upcoming space-related events to your terminal'
arch=('any')
url='https://github.com/not-stirred/nextinspace'
_url_pypi='https://pypi.org/project/nextinspace'
license=('GPL3')
depends=('python-colorama>=0.4.3' 'python-requests>=2.24' 'python-tzlocal')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('80937972053a8411b5a145488dbec8e4049320f9014d012776ae9561c70d418e')

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
