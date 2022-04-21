# Maintainer: Simon Williams <simon@clockcycles.net>
pkgname=pywdgen
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A simple readable password generator, written in Python"
arch=(any)
url="https://github.com/simonpw/pywdgen"
license=('GPL')
groups=()
depends=('python>=3.0')
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
source=("git+https://github.com/simonpw/pywdgen.git")
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
        install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
        install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${$pkgname}/COPYING
}
