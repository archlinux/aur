# Maintainer: Martin Kaffanke <m.kaffanke@gmail.com>

pkgname=michel-orgmode-hg
_pkgname=michel-orgmode
pkgver=r70.0a1f22038245
pkgrel=1
pkgdesc="Sync org-mode files to google-tasks (uses python)"
arch=('i686' 'x86_64')
url="https://bitbucket.org/edgimar/michel-orgmode"
license=('Public Domain')
depends=('google-api-python-client' 'python-gflags' 'python-dateutil' )
makedepends=('mercurial')
provides=('michel-orgmode')
conflicts=('michel-orgmode')
source=("hg+https://bitbucket.org/edgimar/michel-orgmode")
sha256sums=('SKIP')
#options=('!strip')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}

