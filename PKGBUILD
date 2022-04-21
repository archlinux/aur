# Maintainer: Simon Williams <simon@clockcycles.net>
pkgname=nordquery
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="A tool to choose NordVPN servers based on filters, written in Python"
arch=(any)
url="https://github.com/simonpw/nordquery"
license=('GPL')
groups=()
depends=('python>=3.0', 'python-pycountry')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/simonpw/nordquery.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
        cd "$srcdir/$pkgname"
        install -Dm755 nordquery.py ${pkgdir}/usr/bin/nordquery
        install -Dm644 COPYING ${pkgdir}/usr/share/licenses/nordquery/COPYING
}
