# Maintainer: Arondight <shell_way@foxmail.com>

pkgname='xf86-video-nouveau-blacklist-git'
pkgver='v1.0.r0.g9f2561a'
pkgrel=1
pkgdesc='Disable nouveau driver module'
arch=('any')
url='https://github.com/Arondight/xf86-video-nouveau-blacklist.git'
license=('GPL')
groups=()
depends=('xf86-video-nouveau')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}#tag=v1.0")
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
  make install DESTDIR="${pkgdir}/"
}

