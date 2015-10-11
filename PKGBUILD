# Maintainer: Salamandar <felix@piedallu.me>
# Contributor: mdsitton <matthewsitton@gmail.com>
pkgname='python2-fretwork-git'
_gitname='fretwork'
pkgver=r10.f7ea800
pkgrel=1
pkgdesc=" Shared code for FoFiX and FoF:R"
arch=('any')
url="https://github.com/fofix/$_gitname.git"
license=('GPL')
groups=('games')
makedepends=('git' 'python2')
depends=()
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
)
}


package() {
    cd "$srcdir/$_gitname"
    python2 setup.py install --root="$pkgdir"

}
