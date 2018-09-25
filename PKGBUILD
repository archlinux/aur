# Maintainer: Jimmy Stelzer <jimmy.stelzer@gmail.com>
# Contributor: Daniel Maslowski <info@orangecms.org>

_pyname=mbed-cli
pkgname=python-${_pyname}
pkgver=1.8.2
pkgrel=1
pkgdesc="ARM mbed Command Line Interface"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=('python2' 'python2-colorama' 'python2-pyserial' 'python2-intelhex' 'python2-jinja' 'python2-beautifulsoup4' 'python2-fuzzywuzzy' 'python2-prettytable' 'python2-requests' 'python2-yaml' 'python2-pyelftools' 'python2-jsonschema')
optdepends=(
  'git: support git-based mbed projects'
  'mercurial: support mercurial-based mbed projects'
  'python-mbed-host-tests: Flash, reset and supervise tool'
  'python-mbed-greentea: Test automation'
  'python-mbed-ls: Automatic device detection'
)
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://github.com/ARMmbed/mbed-cli/archive/$pkgver.tar.gz")
sha256sums=('431616c1cfe953bbd15676160cac4196eaa54987adcaa40cd63cc07548dadd16')

package() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
