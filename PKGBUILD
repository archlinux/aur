# Maintainer: Stefan Seering <stefanarch@gmx.de>
pkgname='teamspeak-plugin-love-svn'
pkgver=49
pkgrel=2
pkgdesc='Plugin for Teamspeak 3. Allows follwing users through channels.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/p/ts3love/home/ts3love/'
license=('unknown')
depends=('teamspeak3')
makedepends=('subversion' 'teamspeak3' 'unzip') # the teamspeak package contais C header files
source=('svn://svn.code.sf.net/p/ts3love/code/trunk')
md5sums=('SKIP')


build() {
  cd -- trunk
  make libtslove.so
}

package() {
  cd -- trunk
  mkdir -p -- "$pkgdir/opt/teamspeak3/plugins"
  cp libtslove.so "$pkgdir/opt/teamspeak3/plugins"
}

# vim:set ts=2 sw=2 et:
