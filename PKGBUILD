# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname='python-harvey'
_name=harvey
pkgver=0.0.4.4
pkgrel=1
pkgdesc='Harvey is a command line legal expert who manages license for you'
url='https://github.com/architv/harvey'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python' 'python-colorama' 'python-docopt' 'python-requests')
provides=("${_name}=${pkgver}")
source=("https://pypi.python.org/packages/source/h/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2bce5f011215493ea8267cc170466e6845f37293d89ade5e1d1e5ebac72b2572')

# Enable for tests
# check() {
  # cd "${srcdir}/${_name}-${pkgver}"
  # python setup.py check
# }

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  # install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
