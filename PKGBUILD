# Maintainer: Jimmy Stelzer <jimmy.stelzer@gmail.com>
# Contributor: Daniel Maslowski <info@orangecms.org>
# Contributor: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

_pyname=mbed-cli
pkgname=python-${_pyname}
pkgver=1.10.3
pkgrel=1
pkgdesc="ARM mbed Command Line Interface"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=('python' 'python-colorama' 'python-pyserial' 'python-intelhex' 'python-jinja' 'python-beautifulsoup4' 'python-fuzzywuzzy' 'python-prettytable' 'python-requests' 'python-yaml' 'python-pyelftools' 'python-jsonschema')
optdepends=(
  'git: support git-based mbed projects'
  'mercurial: support mercurial-based mbed projects'
  'python-mbed-host-tests: Flash, reset and supervise tool'
  'python-mbed-greentea: Test automation'
  'python-mbed-ls: Automatic device detection'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/ARMmbed/mbed-cli/archive/$pkgver.tar.gz")
sha256sums=('8a95093a89aa8fb7a911775155cdb4b9d124ef6af74393dfc1b0bb79c3e33327')

package() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
