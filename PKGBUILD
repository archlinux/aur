# Maintainer:
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

_module="xmpppy"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.7.3
pkgrel=1
pkgdesc="Python implementation of XMPP (RFC3920, RFC3921)"
url="https://github.com/xmpppy/xmpppy"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/$pkgver.$_pkgext")
sha256sums=('11b0359583be5c3e93824436af5c5a65766e6ff16bb04fcf0855a66f40e959c0')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
