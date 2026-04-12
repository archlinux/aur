# Maintainer: Jan Van der Veken <janvkn ... gmail ... you'll figure it out>
# Contributor: Jasper Follas follasjj@live.co.uk

pkgname=bsp
reponame=bsp-history
pkgver=5.2
pkgrel=8
pkgdesc="The most popular nodebuilder for DOOM"
arch=('i686' 'x86_64')
license=('CCPL:by-sa')
url="http://games.moria.org.uk/doom/bsp/"
depends=('librsvg' 'glibc')
source=(git+https://github.com/chocolatiers/bsp-history#tag=$pkgname-$pkgver)
md5sums=(SKIP)

build() {
  cd $srcdir/$reponame
  autoreconf --install
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
}

package() {
  cd $srcdir/$reponame
  make DESTDIR=$pkgdir install
}
