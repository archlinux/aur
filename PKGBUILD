# notbit GIT version
# Contributor: alphazo@gmail.com
 
_gitname=notbit
pkgname=notbit-git
pkgver=r342.faf0930
pkgrel=1
pkgdesc="A minimal Bitmessage client"
arch=('i686' 'x86_64')
depends=('openssl')
license=('MIT')
url="https://github.com/bpeel/notbit"
makedepends=('git')
provides=("notbit=${pkgver}")
#install=${pkgname}.install
source=("git+https://github.com/bpeel/notbit.git")
sha1sums=('SKIP')
 
pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
build() {
  cd "$_gitname"
 
  ./autogen.sh
 
  ./configure --prefix=/usr \
 
  make
}
 
package() {
  cd "$_gitname"
 
  make DESTDIR=${pkgdir} install
}