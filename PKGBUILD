# Maintainer: Cedric Girard <girard.cedric@gmail.com
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname=python-urwidtrees
_pythonmod=urwidtrees
pkgver=1.0.3.dev0
pkgrel=1
pkgdesc="Tree widgets for urwid"
arch=("any")
url="https://github.com/pazz/urwidtrees"
license=("GPL")
depends=("python-urwid>=1.1.0" 'python-mock')
makedepends=("python-sphinx")
source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
sha256sums=('19197425cd36809bd24741479f963ebab96ebba09fb0fe39635fb14d0b4e4e17')

build() {
    cd "urwidtrees-${pkgver}"
    python setup.py build
}

package() {
    cd "urwidtrees-${pkgver}"
    python setup.py install --root="${pkgdir}" --skip-build
}
