# Maintainer: awh

pkgname=iptckwed-git
_gitname="iptckwed"
pkgver=r4.4360c75
pkgrel=1
pkgdesc="IPTC keyword editor"
arch=('i686' 'x86_64')
url="https://github.com/muennich/iptckwed"
license=('GPL2')
depends=('exiv2' 'gcc-libs-multilib')
makedepends=('git')
source=('git://github.com/muennich/iptckwed.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}
