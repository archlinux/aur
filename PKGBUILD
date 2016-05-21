# Maintainer: Arondight <shell_way@foxmail.com>

pkgname='xf86-video-nouveau-blacklist-git'
pkgver='r1.b6fa4d4'
pkgrel=1
pkgdesc='Disable nouveau driver module'
arch=('any')
url='https://github.com/Arondight/xf86-video-nouveau-blacklist.git'
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}#branch=master")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"

  set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'  \
    || printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
}

check() {
  cd "${srcdir}/${pkgname%-git}"
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  make install DESTDIR=$pkgdir
}

