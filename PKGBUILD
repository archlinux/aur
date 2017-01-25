# Maintainer: Martijn Terpstra <bigmartijn@gmail.com>
pkgname=rice3d
pkgver=r75.bb4e3f0
pkgrel=1
pkgdesc="command line 3d model viewer using text and terminal escape codes"
arch=('i686' 'x86_64')
url="https://github.com/martijnat/rice3d"
license=('GPL')
depends=('python')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=('rice3d')
source=("$pkgname::git+https://github.com/martijnat/rice3d")
md5sums=('SKIP')

pkgver() {
         cd "$srcdir/$pkgname"
         # Git, no tags available
         printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/$pkgname"
        make
}

package() {
          cd "$srcdir/$pkgname"
          make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
