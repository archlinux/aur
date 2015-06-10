# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor:  Victor Feight <vrfeight3 at gmail dot com>

pkgname=gsimplecal-git
_gitname=gsimplecal
pkgver=2014.12.09.c544ee9
pkgrel=1
pkgdesc="Simple and lightweight GTK calendar (git)"
arch=('i686' 'x86_64')
url="http://dmedvinsky.github.com/gsimplecal/"
license=('GPL')
depends=('gtk3')
makedepends=('git')
conflicts=('gsimplecal-hg' 'gsimplecal')
source=('git://github.com/dmedvinsky/gsimplecal.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd.%h" --date=short | sed 's:-:.:g'
}

build() {
  cd "$srcdir/$_gitname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" install
}
