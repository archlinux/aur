# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgbase='gtimelog'
pkgname=gtimelog-collabora-git
pkgver=r338.7890123
pkgrel=1
pkgdesc="A time tracking application: Collabora repository."
provides=('gtimelog')
arch=('any')
url="https://git.collabora.co.uk/cgit/gtimelog.git"
license=('GPL2')
depends=(
  'libsoup'
  'python2'
  'python2-gobject'
  'python2-setuptools'
  'python2-gnomekeyring')
makedepends=('git' 'python2' 'python2-setuptools')
source=(
  "$_pkgbase::git+https://gitlab.collabora.com/collabora/gtimelog.git"
)

pkgver() {
  cd "$srcdir/$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgbase"
  python2 setup.py install --root="$pkgdir/"
}

sha256sums=('SKIP')
