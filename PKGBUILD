# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=mbed-cli
pkgname=python-${_pyname}
pkgver=1.1.1
pkgrel=3
pkgdesc="ARM mbed Command Line Interface"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=(
  'python2'
  'python2-beautifulsoup4'
  'python2-colorama'
  'python2-fuzzywuzzy'
  'python2-intelhex'
  'python2-jinja'
  'python2-prettytable'
  'python2-pyserial'
  'python2-requests'
  'python2-yaml'
)
optdepends=(
  'git: support git-based mbed projects'
  'mercurial: support mercurial-based mbed projects'
)
options=(!emptydirs)
source=("https://github.com/ARMmbed/mbed-cli/archive/$pkgver.tar.gz")
sha256sums=('58cafc4dc964b40fd7ae5bb714de68679e663d7770af31d93af2f6db720f9b46')

package() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
