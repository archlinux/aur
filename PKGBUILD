# Contributor: Stas Bourakov <sbourakov(at)gmail.com>
pkgname=libdvbsi++
pkgver=20130923
pkgrel=1
pkgdesc="libdvbsi++ - A free DVB SI parser library written in C++"
arch=('i686' 'x86_64')
url="http://git.opendreambox.org/?p=obi/libdvbsi%2B%2B.git;a=summary"
license=('GPL2')
depends=('gcc-libs')
makedepends=('git' 'make')
conflicts=()
source='git://git.opendreambox.org/git/obi/libdvbsi++.git'
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

package() {

    cd $srcdir/$pkgname

    ./autogen.sh || return 1
    ./configure --prefix=/usr || return 1
    make || return 1
    make install DESTDIR=$pkgdir || return 1
}
