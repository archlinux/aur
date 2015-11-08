# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname='python-harvey'
_name=harvey
pkgver=0.0.5
pkgrel=1
pkgdesc='Harvey is a command line legal expert who manages license for you'
url='https://github.com/architv/harvey'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python' 'python-colorama' 'python-docopt' 'python-requests')
provides=("${_name}=${pkgver}")
source=("https://pypi.python.org/packages/source/h/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d95b2133caed751addaea17cf2d03979169deb4043129224bb60f6ed5f6299f5')

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
