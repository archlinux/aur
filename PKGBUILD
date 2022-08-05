# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
_pkgname=hazwaz
pkgname=python-$_pkgname
pkgver=0.0.2
pkgrel=1
pkgdesc="A python library to write command line scripts"
arch=('any')
url="https://hazwaz.trueelena.org/"
license=(GPL3)
depends=('python')
optdepends=('python-coloredlogs: pretty log output')
makedepends=('python-setuptools')
source=("https://git.sr.ht/~valhalla/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('26c047356a3e9f44bd3b6f61c774e1f7a06ce8cebe8f6e73cd98ea6bb2b4851d')

prepare() {
  cd "${_pkgname}-v${pkgver}"
}

build() {
  cd "${_pkgname}-v${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
