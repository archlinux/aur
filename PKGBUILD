# Maintainer: Maxime “pep” Buquet <archlinux@bouah.net>

pkgname=python-slixmpp-omemo
_pkgbase=slixmpp-omemo
_tag=v0.4.0
pkgver=v0.4.0.r0.g266684b
pkgrel=1
pkgdesc="Slixmpp OMEMO plugin"
arch=(any)
url="https://lab.louiz.org/poezio/slixmpp-omemo"
license=('GPL3')
depends=(
  'python>=3.5'
  'python-slixmpp'
  'python-omemo-syndace'
  'python-setuptools')
provides=('python-slixmpp-omemo')
conflicts=('python-slixmpp-omemo')
makedepends=('git' 'python-setuptools')

source=("${_pkgbase}::git+https://lab.louiz.org/poezio/${_pkgbase}#tag=${_tag}")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbase"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_pkgbase"
    python setup.py install --root="$pkgdir/" --optimize=1
}
