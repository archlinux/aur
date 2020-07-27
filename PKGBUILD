# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>
pkgname=icat-git
pkgver=v0.5.r1.02c76a3
pkgrel=1
pkgdesc="icat (Image cat) outputs images in 256-color capable terminals."
arch=(x86_64)
url="https://github.com/atextor/icat"
license=('GPL')
groups=()
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/atextor/icat')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 icat "$pkgdir/usr/bin/icat"
}
