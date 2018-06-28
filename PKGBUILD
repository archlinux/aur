# Maintainer: Jonas Jelten <jj@stusta.net>

_pkgbase='kevin'
pkgname="$_pkgbase-git"
pkgver=v0.4.r0.gfda3809
pkgrel=1
pkgdesc="Kevin-CI: a simple-stupid self-hosted continuous integration service"
arch=('any')
url="https://github.com/SFTtech/kevin"
license=('AGPL3')
groups=()
depends=('python' 'python-requests' 'python-tornado')
makedepends=('git')
provides=('kevin')
conflicts=('kevin')
replaces=()
backup=()
options=()
install=
source=("$_pkgbase::git+https://github.com/SFTtech/kevin")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgbase"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgbase"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
