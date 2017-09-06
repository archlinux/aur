_repo="znc-clientbuffer"
pkgname=${_repo}-git
pkgver=r17.8691abf
pkgrel=1
pkgdesc=" ZNC module for client specific buffers"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/jpnurmi/znc-clientbuffer"
license=('Apache')
depends=('znc')
source=("git+https://github.com/jpnurmi/znc-clientbuffer.git")

pkgver() {
  cd "$_repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_repo"
  znc-buildmod clientbuffer.cpp
}

package() {
  cd "$_repo"
  install -Dm755 clientbuffer.so "$pkgdir/usr/lib/znc/clientbuffer.so"
}
sha256sums=('SKIP')
