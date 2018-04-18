# Maintainer: Jimmy Stelzer <jimmy.stelzer@gmail.com>
# Contributor: Daniel Maslowski <info@orangecms.org>

_pyname=mbed-cli
pkgname=python-${_pyname}
pkgver=1.5.0
pkgrel=1
pkgdesc="ARM mbed Command Line Interface"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=('python2' 'python2-colorama' 'python2-pyserial' 'python2-intelhex' 'python2-jinja' 'python2-beautifulsoup4' 'python2-fuzzywuzzy' 'python2-prettytable' 'python2-requests' 'python2-yaml')
optdepends=(
  'git: support git-based mbed projects'
  'mercurial: support mercurial-based mbed projects'
)
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://github.com/ARMmbed/mbed-cli/archive/$pkgver.tar.gz")
sha256sums=('45dbe612b42511ca601ae474b653ef61a80e2f3da4515029fa58b9cd027ef50d')

package() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
