# Maintainer Maxime “pep” Buquet <archlinux@bouah.net>

pkgname=python-slixmpp-omemo-git
_pkgbase=slixmpp-omemo
pkgver=r200.159610b
pkgrel=1
pkgdesc="Slixmpp OMEMO plugin"
arch=(any)
url="https://codeberg.org/poezio/slixmpp-omemo"
license=('GPL3')
depends=(
  'python>=3.5'
  'python-slixmpp'
  'python-omemo-syndace'
  'python-setuptools')
provides=('python-slixmpp-omemo')
conflicts=('python-slixmpp-omemo')
makedepends=('git' 'python-setuptools')

source=("${_pkgbase}::git+https://codeberg.org/poezio/slixmpp-omemo.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbase"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgbase"
    python setup.py install --root="$pkgdir/" --optimize=1
}
