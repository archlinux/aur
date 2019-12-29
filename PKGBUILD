# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_tagname=v0.1.0
pkgname=poezio-omemo
_pkgname=${pkgname}
pkgrel=1
pkgver=v0.1.0.758b916
pkgdesc="OMEMO plugin for the Poezio XMPP console client"
arch=('i686' 'x86_64')
url="https://lab.louiz.org/poezio/poezio-omemo"
conflicts=('poezio-omemo')
provides=('poezio-omemo')
license=('GPL')
depends=(
  'python'
  'python-setuptools'
  'poezio-git'
  'python-slixmpp-omemo'
)
makedepends=('git')

source=("${_pkgname}::git+https://lab.louiz.org/poezio/poezio-omemo#tag=${_tagname}")

pkgver() {
  cd $srcdir/$_pkgbase
  echo "${_tagname}.$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python3 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

sha256sums=('SKIP')
